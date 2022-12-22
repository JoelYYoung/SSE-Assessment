; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_31_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !27
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !36, metadata !DIExpression()), !dbg !38
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !39
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !40, metadata !DIExpression()), !dbg !41
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !42
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data1, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !58
  %cmp2 = icmp ult i64 %4, 100, !dbg !60
  br i1 %cmp2, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !64
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !65
  store i32 0, i32* %intOne, align 8, !dbg !66
  %6 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !68
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !69
  store i32 0, i32* %intTwo, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %7, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !77
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !78
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !78
  %10 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !78
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 800, i1 false), !dbg !78
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !79
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !79
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !80
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !81
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !81
  call void @free(i8* %13) #6, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_31_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #6, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #6, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_31_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_31_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !110
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !111
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !112
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !113
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !114
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !120, metadata !DIExpression()), !dbg !122
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !123
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !124, metadata !DIExpression()), !dbg !125
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !126
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data1, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !136
  %cmp2 = icmp ult i64 %4, 100, !dbg !138
  br i1 %cmp2, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !142
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !143
  store i32 0, i32* %intOne, align 8, !dbg !144
  %6 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !146
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !147
  store i32 0, i32* %intTwo, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %7, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !154
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !155
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !155
  %10 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !155
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 800, i1 false), !dbg !155
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !156
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !156
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !157
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !158
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !158
  call void @free(i8* %13) #6, !dbg !159
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_31_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_31.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 26, column: 29, scope: !20)
!28 = !DILocation(line: 26, column: 12, scope: !20)
!29 = !DILocation(line: 26, column: 10, scope: !20)
!30 = !DILocation(line: 27, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !21, line: 27, column: 9)
!32 = !DILocation(line: 27, column: 14, scope: !31)
!33 = !DILocation(line: 27, column: 9, scope: !20)
!34 = !DILocation(line: 27, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 27, column: 23)
!36 = !DILocalVariable(name: "dataCopy", scope: !37, file: !21, line: 29, type: !4)
!37 = distinct !DILexicalBlock(scope: !20, file: !21, line: 28, column: 5)
!38 = !DILocation(line: 29, column: 25, scope: !37)
!39 = !DILocation(line: 29, column: 36, scope: !37)
!40 = !DILocalVariable(name: "data", scope: !37, file: !21, line: 30, type: !4)
!41 = !DILocation(line: 30, column: 25, scope: !37)
!42 = !DILocation(line: 30, column: 32, scope: !37)
!43 = !DILocalVariable(name: "source", scope: !44, file: !21, line: 32, type: !45)
!44 = distinct !DILexicalBlock(scope: !37, file: !21, line: 31, column: 9)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 32, column: 27, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !50, file: !21, line: 34, type: !51)
!50 = distinct !DILexicalBlock(scope: !44, file: !21, line: 33, column: 13)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 34, column: 24, scope: !50)
!55 = !DILocation(line: 36, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !21, line: 36, column: 17)
!57 = !DILocation(line: 36, column: 22, scope: !56)
!58 = !DILocation(line: 36, column: 29, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !21, line: 36, column: 17)
!60 = !DILocation(line: 36, column: 31, scope: !59)
!61 = !DILocation(line: 36, column: 17, scope: !56)
!62 = !DILocation(line: 38, column: 28, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !21, line: 37, column: 17)
!64 = !DILocation(line: 38, column: 21, scope: !63)
!65 = !DILocation(line: 38, column: 31, scope: !63)
!66 = !DILocation(line: 38, column: 38, scope: !63)
!67 = !DILocation(line: 39, column: 28, scope: !63)
!68 = !DILocation(line: 39, column: 21, scope: !63)
!69 = !DILocation(line: 39, column: 31, scope: !63)
!70 = !DILocation(line: 39, column: 38, scope: !63)
!71 = !DILocation(line: 40, column: 17, scope: !63)
!72 = !DILocation(line: 36, column: 39, scope: !59)
!73 = !DILocation(line: 36, column: 17, scope: !59)
!74 = distinct !{!74, !61, !75, !76}
!75 = !DILocation(line: 40, column: 17, scope: !56)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 43, column: 20, scope: !44)
!78 = !DILocation(line: 43, column: 13, scope: !44)
!79 = !DILocation(line: 44, column: 30, scope: !44)
!80 = !DILocation(line: 44, column: 13, scope: !44)
!81 = !DILocation(line: 45, column: 18, scope: !44)
!82 = !DILocation(line: 45, column: 13, scope: !44)
!83 = !DILocation(line: 48, column: 1, scope: !20)
!84 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_31_good", scope: !21, file: !21, line: 84, type: !22, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 86, column: 5, scope: !84)
!86 = !DILocation(line: 87, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 98, type: !88, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!10, !10, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !21, line: 98, type: !10)
!94 = !DILocation(line: 98, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !21, line: 98, type: !90)
!96 = !DILocation(line: 98, column: 27, scope: !87)
!97 = !DILocation(line: 101, column: 22, scope: !87)
!98 = !DILocation(line: 101, column: 12, scope: !87)
!99 = !DILocation(line: 101, column: 5, scope: !87)
!100 = !DILocation(line: 103, column: 5, scope: !87)
!101 = !DILocation(line: 104, column: 5, scope: !87)
!102 = !DILocation(line: 105, column: 5, scope: !87)
!103 = !DILocation(line: 108, column: 5, scope: !87)
!104 = !DILocation(line: 109, column: 5, scope: !87)
!105 = !DILocation(line: 110, column: 5, scope: !87)
!106 = !DILocation(line: 112, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 55, type: !22, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !21, line: 57, type: !4)
!109 = !DILocation(line: 57, column: 21, scope: !107)
!110 = !DILocation(line: 58, column: 10, scope: !107)
!111 = !DILocation(line: 60, column: 29, scope: !107)
!112 = !DILocation(line: 60, column: 12, scope: !107)
!113 = !DILocation(line: 60, column: 10, scope: !107)
!114 = !DILocation(line: 61, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !107, file: !21, line: 61, column: 9)
!116 = !DILocation(line: 61, column: 14, scope: !115)
!117 = !DILocation(line: 61, column: 9, scope: !107)
!118 = !DILocation(line: 61, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !21, line: 61, column: 23)
!120 = !DILocalVariable(name: "dataCopy", scope: !121, file: !21, line: 63, type: !4)
!121 = distinct !DILexicalBlock(scope: !107, file: !21, line: 62, column: 5)
!122 = !DILocation(line: 63, column: 25, scope: !121)
!123 = !DILocation(line: 63, column: 36, scope: !121)
!124 = !DILocalVariable(name: "data", scope: !121, file: !21, line: 64, type: !4)
!125 = !DILocation(line: 64, column: 25, scope: !121)
!126 = !DILocation(line: 64, column: 32, scope: !121)
!127 = !DILocalVariable(name: "source", scope: !128, file: !21, line: 66, type: !45)
!128 = distinct !DILexicalBlock(scope: !121, file: !21, line: 65, column: 9)
!129 = !DILocation(line: 66, column: 27, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !131, file: !21, line: 68, type: !51)
!131 = distinct !DILexicalBlock(scope: !128, file: !21, line: 67, column: 13)
!132 = !DILocation(line: 68, column: 24, scope: !131)
!133 = !DILocation(line: 70, column: 24, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !21, line: 70, column: 17)
!135 = !DILocation(line: 70, column: 22, scope: !134)
!136 = !DILocation(line: 70, column: 29, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !21, line: 70, column: 17)
!138 = !DILocation(line: 70, column: 31, scope: !137)
!139 = !DILocation(line: 70, column: 17, scope: !134)
!140 = !DILocation(line: 72, column: 28, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !21, line: 71, column: 17)
!142 = !DILocation(line: 72, column: 21, scope: !141)
!143 = !DILocation(line: 72, column: 31, scope: !141)
!144 = !DILocation(line: 72, column: 38, scope: !141)
!145 = !DILocation(line: 73, column: 28, scope: !141)
!146 = !DILocation(line: 73, column: 21, scope: !141)
!147 = !DILocation(line: 73, column: 31, scope: !141)
!148 = !DILocation(line: 73, column: 38, scope: !141)
!149 = !DILocation(line: 74, column: 17, scope: !141)
!150 = !DILocation(line: 70, column: 39, scope: !137)
!151 = !DILocation(line: 70, column: 17, scope: !137)
!152 = distinct !{!152, !139, !153, !76}
!153 = !DILocation(line: 74, column: 17, scope: !134)
!154 = !DILocation(line: 77, column: 20, scope: !128)
!155 = !DILocation(line: 77, column: 13, scope: !128)
!156 = !DILocation(line: 78, column: 30, scope: !128)
!157 = !DILocation(line: 78, column: 13, scope: !128)
!158 = !DILocation(line: 79, column: 18, scope: !128)
!159 = !DILocation(line: 79, column: 13, scope: !128)
!160 = !DILocation(line: 82, column: 1, scope: !107)
