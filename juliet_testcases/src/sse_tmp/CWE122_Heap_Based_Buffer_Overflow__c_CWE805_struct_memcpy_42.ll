; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_42_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !27
  %call = call %struct._twoIntsStruct* @badSource(%struct._twoIntsStruct* %0), !dbg !28
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %1, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !51
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !52
  store i32 0, i32* %intOne, align 8, !dbg !53
  %3 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !55
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !56
  store i32 0, i32* %intTwo, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %4, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !64
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !65
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !65
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !65
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !65
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !66
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !67
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !68
  call void @free(i8* %10) #6, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @badSource(%struct._twoIntsStruct* %data) #0 !dbg !71 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !76
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !77
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data.addr, align 8, !dbg !78
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !79
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !85
  ret %struct._twoIntsStruct* %2, !dbg !86
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_42_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #6, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #6, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_42_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_42_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !111, metadata !DIExpression()), !dbg !112
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !113
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !114
  %call = call %struct._twoIntsStruct* @goodG2BSource(%struct._twoIntsStruct* %0), !dbg !115
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !126
  %cmp = icmp ult i64 %1, 100, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !132
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !133
  store i32 0, i32* %intOne, align 8, !dbg !134
  %3 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !136
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !137
  store i32 0, i32* %intTwo, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %4, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !144
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !145
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !145
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !145
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !145
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !146
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !146
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !147
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !148
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !148
  call void @free(i8* %10) #6, !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @goodG2BSource(%struct._twoIntsStruct* %data) #0 !dbg !151 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !152, metadata !DIExpression()), !dbg !153
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !154
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !155
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data.addr, align 8, !dbg !156
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !157
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !159
  br i1 %cmp, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !161
  unreachable, !dbg !161

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !163
  ret %struct._twoIntsStruct* %2, !dbg !164
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !13}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !7, line: 100, baseType: !8)
!7 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !7, line: 96, size: 64, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !8, file: !7, line: 98, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !8, file: !7, line: 99, baseType: !11, size: 32, offset: 32)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_42_bad", scope: !21, file: !21, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_42.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 31, type: !5)
!25 = !DILocation(line: 31, column: 21, scope: !20)
!26 = !DILocation(line: 32, column: 10, scope: !20)
!27 = !DILocation(line: 33, column: 22, scope: !20)
!28 = !DILocation(line: 33, column: 12, scope: !20)
!29 = !DILocation(line: 33, column: 10, scope: !20)
!30 = !DILocalVariable(name: "source", scope: !31, file: !21, line: 35, type: !32)
!31 = distinct !DILexicalBlock(scope: !20, file: !21, line: 34, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 35, column: 23, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !37, file: !21, line: 37, type: !38)
!37 = distinct !DILexicalBlock(scope: !31, file: !21, line: 36, column: 9)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 37, column: 20, scope: !37)
!42 = !DILocation(line: 39, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !21, line: 39, column: 13)
!44 = !DILocation(line: 39, column: 18, scope: !43)
!45 = !DILocation(line: 39, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !21, line: 39, column: 13)
!47 = !DILocation(line: 39, column: 27, scope: !46)
!48 = !DILocation(line: 39, column: 13, scope: !43)
!49 = !DILocation(line: 41, column: 24, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !21, line: 40, column: 13)
!51 = !DILocation(line: 41, column: 17, scope: !50)
!52 = !DILocation(line: 41, column: 27, scope: !50)
!53 = !DILocation(line: 41, column: 34, scope: !50)
!54 = !DILocation(line: 42, column: 24, scope: !50)
!55 = !DILocation(line: 42, column: 17, scope: !50)
!56 = !DILocation(line: 42, column: 27, scope: !50)
!57 = !DILocation(line: 42, column: 34, scope: !50)
!58 = !DILocation(line: 43, column: 13, scope: !50)
!59 = !DILocation(line: 39, column: 35, scope: !46)
!60 = !DILocation(line: 39, column: 13, scope: !46)
!61 = distinct !{!61, !48, !62, !63}
!62 = !DILocation(line: 43, column: 13, scope: !43)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 46, column: 16, scope: !31)
!65 = !DILocation(line: 46, column: 9, scope: !31)
!66 = !DILocation(line: 47, column: 26, scope: !31)
!67 = !DILocation(line: 47, column: 9, scope: !31)
!68 = !DILocation(line: 48, column: 14, scope: !31)
!69 = !DILocation(line: 48, column: 9, scope: !31)
!70 = !DILocation(line: 50, column: 1, scope: !20)
!71 = distinct !DISubprogram(name: "badSource", scope: !21, file: !21, line: 21, type: !72, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!5, !5}
!74 = !DILocalVariable(name: "data", arg: 1, scope: !71, file: !21, line: 21, type: !5)
!75 = !DILocation(line: 21, column: 50, scope: !71)
!76 = !DILocation(line: 24, column: 29, scope: !71)
!77 = !DILocation(line: 24, column: 12, scope: !71)
!78 = !DILocation(line: 24, column: 10, scope: !71)
!79 = !DILocation(line: 25, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !71, file: !21, line: 25, column: 9)
!81 = !DILocation(line: 25, column: 14, scope: !80)
!82 = !DILocation(line: 25, column: 9, scope: !71)
!83 = !DILocation(line: 25, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !21, line: 25, column: 23)
!85 = !DILocation(line: 26, column: 12, scope: !71)
!86 = !DILocation(line: 26, column: 5, scope: !71)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_42_good", scope: !21, file: !21, line: 88, type: !22, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 90, column: 5, scope: !87)
!89 = !DILocation(line: 91, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 103, type: !91, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!11, !11, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !21, line: 103, type: !11)
!97 = !DILocation(line: 103, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !21, line: 103, type: !93)
!99 = !DILocation(line: 103, column: 27, scope: !90)
!100 = !DILocation(line: 106, column: 22, scope: !90)
!101 = !DILocation(line: 106, column: 12, scope: !90)
!102 = !DILocation(line: 106, column: 5, scope: !90)
!103 = !DILocation(line: 108, column: 5, scope: !90)
!104 = !DILocation(line: 109, column: 5, scope: !90)
!105 = !DILocation(line: 110, column: 5, scope: !90)
!106 = !DILocation(line: 113, column: 5, scope: !90)
!107 = !DILocation(line: 114, column: 5, scope: !90)
!108 = !DILocation(line: 115, column: 5, scope: !90)
!109 = !DILocation(line: 117, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 65, type: !22, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !21, line: 67, type: !5)
!112 = !DILocation(line: 67, column: 21, scope: !110)
!113 = !DILocation(line: 68, column: 10, scope: !110)
!114 = !DILocation(line: 69, column: 26, scope: !110)
!115 = !DILocation(line: 69, column: 12, scope: !110)
!116 = !DILocation(line: 69, column: 10, scope: !110)
!117 = !DILocalVariable(name: "source", scope: !118, file: !21, line: 71, type: !32)
!118 = distinct !DILexicalBlock(scope: !110, file: !21, line: 70, column: 5)
!119 = !DILocation(line: 71, column: 23, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !121, file: !21, line: 73, type: !38)
!121 = distinct !DILexicalBlock(scope: !118, file: !21, line: 72, column: 9)
!122 = !DILocation(line: 73, column: 20, scope: !121)
!123 = !DILocation(line: 75, column: 20, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !21, line: 75, column: 13)
!125 = !DILocation(line: 75, column: 18, scope: !124)
!126 = !DILocation(line: 75, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !21, line: 75, column: 13)
!128 = !DILocation(line: 75, column: 27, scope: !127)
!129 = !DILocation(line: 75, column: 13, scope: !124)
!130 = !DILocation(line: 77, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !21, line: 76, column: 13)
!132 = !DILocation(line: 77, column: 17, scope: !131)
!133 = !DILocation(line: 77, column: 27, scope: !131)
!134 = !DILocation(line: 77, column: 34, scope: !131)
!135 = !DILocation(line: 78, column: 24, scope: !131)
!136 = !DILocation(line: 78, column: 17, scope: !131)
!137 = !DILocation(line: 78, column: 27, scope: !131)
!138 = !DILocation(line: 78, column: 34, scope: !131)
!139 = !DILocation(line: 79, column: 13, scope: !131)
!140 = !DILocation(line: 75, column: 35, scope: !127)
!141 = !DILocation(line: 75, column: 13, scope: !127)
!142 = distinct !{!142, !129, !143, !63}
!143 = !DILocation(line: 79, column: 13, scope: !124)
!144 = !DILocation(line: 82, column: 16, scope: !118)
!145 = !DILocation(line: 82, column: 9, scope: !118)
!146 = !DILocation(line: 83, column: 26, scope: !118)
!147 = !DILocation(line: 83, column: 9, scope: !118)
!148 = !DILocation(line: 84, column: 14, scope: !118)
!149 = !DILocation(line: 84, column: 9, scope: !118)
!150 = !DILocation(line: 86, column: 1, scope: !110)
!151 = distinct !DISubprogram(name: "goodG2BSource", scope: !21, file: !21, line: 56, type: !72, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", arg: 1, scope: !151, file: !21, line: 56, type: !5)
!153 = !DILocation(line: 56, column: 54, scope: !151)
!154 = !DILocation(line: 59, column: 29, scope: !151)
!155 = !DILocation(line: 59, column: 12, scope: !151)
!156 = !DILocation(line: 59, column: 10, scope: !151)
!157 = !DILocation(line: 60, column: 9, scope: !158)
!158 = distinct !DILexicalBlock(scope: !151, file: !21, line: 60, column: 9)
!159 = !DILocation(line: 60, column: 14, scope: !158)
!160 = !DILocation(line: 60, column: 9, scope: !151)
!161 = !DILocation(line: 60, column: 24, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !21, line: 60, column: 23)
!163 = !DILocation(line: 61, column: 12, scope: !151)
!164 = !DILocation(line: 61, column: 5, scope: !151)
