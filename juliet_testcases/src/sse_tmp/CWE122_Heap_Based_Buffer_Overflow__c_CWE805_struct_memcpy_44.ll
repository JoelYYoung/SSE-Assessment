; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_44_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !26, metadata !DIExpression()), !dbg !30
  store void (%struct._twoIntsStruct*)* @badSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !32
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !41
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !42
  call void %2(%struct._twoIntsStruct* %3), !dbg !41
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(%struct._twoIntsStruct* %data) #0 !dbg !44 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i, metadata !53, metadata !DIExpression()), !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !62
  %cmp = icmp ult i64 %0, 100, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !68
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !69
  store i32 0, i32* %intOne, align 8, !dbg !70
  %2 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !72
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !73
  store i32 0, i32* %intTwo, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %3, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !81
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !82
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !82
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !82
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !82
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !83
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !83
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !84
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !85
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !85
  call void @free(i8* %9) #6, !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_44_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #6, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #6, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_44_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_44_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !114, metadata !DIExpression()), !dbg !115
  store void (%struct._twoIntsStruct*)* @goodG2BSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !115
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !116
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !117
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !118
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !119
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !120
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %entry
  %2 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !126
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !127
  call void %2(%struct._twoIntsStruct* %3), !dbg !126
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !129 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !141
  %cmp = icmp ult i64 %0, 100, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !147
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !148
  store i32 0, i32* %intOne, align 8, !dbg !149
  %2 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !151
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !152
  store i32 0, i32* %intTwo, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %3, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !159
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !160
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !160
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !160
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !160
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !161
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !161
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !162
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !163
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !163
  call void @free(i8* %9) #6, !dbg !164
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_44_bad", scope: !21, file: !21, line: 41, type: !22, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 43, type: !4)
!25 = !DILocation(line: 43, column: 21, scope: !20)
!26 = !DILocalVariable(name: "funcPtr", scope: !20, file: !21, line: 45, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !4}
!30 = !DILocation(line: 45, column: 12, scope: !20)
!31 = !DILocation(line: 46, column: 10, scope: !20)
!32 = !DILocation(line: 48, column: 29, scope: !20)
!33 = !DILocation(line: 48, column: 12, scope: !20)
!34 = !DILocation(line: 48, column: 10, scope: !20)
!35 = !DILocation(line: 49, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !20, file: !21, line: 49, column: 9)
!37 = !DILocation(line: 49, column: 14, scope: !36)
!38 = !DILocation(line: 49, column: 9, scope: !20)
!39 = !DILocation(line: 49, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !21, line: 49, column: 23)
!41 = !DILocation(line: 51, column: 5, scope: !20)
!42 = !DILocation(line: 51, column: 13, scope: !20)
!43 = !DILocation(line: 52, column: 1, scope: !20)
!44 = distinct !DISubprogram(name: "badSink", scope: !21, file: !21, line: 21, type: !28, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocalVariable(name: "data", arg: 1, scope: !44, file: !21, line: 21, type: !4)
!46 = !DILocation(line: 21, column: 37, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !21, line: 24, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !21, line: 23, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 24, column: 23, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !54, file: !21, line: 26, type: !55)
!54 = distinct !DILexicalBlock(scope: !48, file: !21, line: 25, column: 9)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !56, line: 46, baseType: !57)
!56 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 26, column: 20, scope: !54)
!59 = !DILocation(line: 28, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !21, line: 28, column: 13)
!61 = !DILocation(line: 28, column: 18, scope: !60)
!62 = !DILocation(line: 28, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !21, line: 28, column: 13)
!64 = !DILocation(line: 28, column: 27, scope: !63)
!65 = !DILocation(line: 28, column: 13, scope: !60)
!66 = !DILocation(line: 30, column: 24, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !21, line: 29, column: 13)
!68 = !DILocation(line: 30, column: 17, scope: !67)
!69 = !DILocation(line: 30, column: 27, scope: !67)
!70 = !DILocation(line: 30, column: 34, scope: !67)
!71 = !DILocation(line: 31, column: 24, scope: !67)
!72 = !DILocation(line: 31, column: 17, scope: !67)
!73 = !DILocation(line: 31, column: 27, scope: !67)
!74 = !DILocation(line: 31, column: 34, scope: !67)
!75 = !DILocation(line: 32, column: 13, scope: !67)
!76 = !DILocation(line: 28, column: 35, scope: !63)
!77 = !DILocation(line: 28, column: 13, scope: !63)
!78 = distinct !{!78, !65, !79, !80}
!79 = !DILocation(line: 32, column: 13, scope: !60)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 35, column: 16, scope: !48)
!82 = !DILocation(line: 35, column: 9, scope: !48)
!83 = !DILocation(line: 36, column: 26, scope: !48)
!84 = !DILocation(line: 36, column: 9, scope: !48)
!85 = !DILocation(line: 37, column: 14, scope: !48)
!86 = !DILocation(line: 37, column: 9, scope: !48)
!87 = !DILocation(line: 39, column: 1, scope: !44)
!88 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_44_good", scope: !21, file: !21, line: 90, type: !22, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 92, column: 5, scope: !88)
!90 = !DILocation(line: 93, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 104, type: !92, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!10, !10, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !21, line: 104, type: !10)
!98 = !DILocation(line: 104, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !21, line: 104, type: !94)
!100 = !DILocation(line: 104, column: 27, scope: !91)
!101 = !DILocation(line: 107, column: 22, scope: !91)
!102 = !DILocation(line: 107, column: 12, scope: !91)
!103 = !DILocation(line: 107, column: 5, scope: !91)
!104 = !DILocation(line: 109, column: 5, scope: !91)
!105 = !DILocation(line: 110, column: 5, scope: !91)
!106 = !DILocation(line: 111, column: 5, scope: !91)
!107 = !DILocation(line: 114, column: 5, scope: !91)
!108 = !DILocation(line: 115, column: 5, scope: !91)
!109 = !DILocation(line: 116, column: 5, scope: !91)
!110 = !DILocation(line: 118, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 79, type: !22, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !21, line: 81, type: !4)
!113 = !DILocation(line: 81, column: 21, scope: !111)
!114 = !DILocalVariable(name: "funcPtr", scope: !111, file: !21, line: 82, type: !27)
!115 = !DILocation(line: 82, column: 12, scope: !111)
!116 = !DILocation(line: 83, column: 10, scope: !111)
!117 = !DILocation(line: 85, column: 29, scope: !111)
!118 = !DILocation(line: 85, column: 12, scope: !111)
!119 = !DILocation(line: 85, column: 10, scope: !111)
!120 = !DILocation(line: 86, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !21, line: 86, column: 9)
!122 = !DILocation(line: 86, column: 14, scope: !121)
!123 = !DILocation(line: 86, column: 9, scope: !111)
!124 = !DILocation(line: 86, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !21, line: 86, column: 23)
!126 = !DILocation(line: 87, column: 5, scope: !111)
!127 = !DILocation(line: 87, column: 13, scope: !111)
!128 = !DILocation(line: 88, column: 1, scope: !111)
!129 = distinct !DISubprogram(name: "goodG2BSink", scope: !21, file: !21, line: 59, type: !28, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "data", arg: 1, scope: !129, file: !21, line: 59, type: !4)
!131 = !DILocation(line: 59, column: 41, scope: !129)
!132 = !DILocalVariable(name: "source", scope: !133, file: !21, line: 62, type: !49)
!133 = distinct !DILexicalBlock(scope: !129, file: !21, line: 61, column: 5)
!134 = !DILocation(line: 62, column: 23, scope: !133)
!135 = !DILocalVariable(name: "i", scope: !136, file: !21, line: 64, type: !55)
!136 = distinct !DILexicalBlock(scope: !133, file: !21, line: 63, column: 9)
!137 = !DILocation(line: 64, column: 20, scope: !136)
!138 = !DILocation(line: 66, column: 20, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !21, line: 66, column: 13)
!140 = !DILocation(line: 66, column: 18, scope: !139)
!141 = !DILocation(line: 66, column: 25, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !21, line: 66, column: 13)
!143 = !DILocation(line: 66, column: 27, scope: !142)
!144 = !DILocation(line: 66, column: 13, scope: !139)
!145 = !DILocation(line: 68, column: 24, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !21, line: 67, column: 13)
!147 = !DILocation(line: 68, column: 17, scope: !146)
!148 = !DILocation(line: 68, column: 27, scope: !146)
!149 = !DILocation(line: 68, column: 34, scope: !146)
!150 = !DILocation(line: 69, column: 24, scope: !146)
!151 = !DILocation(line: 69, column: 17, scope: !146)
!152 = !DILocation(line: 69, column: 27, scope: !146)
!153 = !DILocation(line: 69, column: 34, scope: !146)
!154 = !DILocation(line: 70, column: 13, scope: !146)
!155 = !DILocation(line: 66, column: 35, scope: !142)
!156 = !DILocation(line: 66, column: 13, scope: !142)
!157 = distinct !{!157, !144, !158, !80}
!158 = !DILocation(line: 70, column: 13, scope: !139)
!159 = !DILocation(line: 73, column: 16, scope: !133)
!160 = !DILocation(line: 73, column: 9, scope: !133)
!161 = !DILocation(line: 74, column: 26, scope: !133)
!162 = !DILocation(line: 74, column: 9, scope: !133)
!163 = !DILocation(line: 75, column: 14, scope: !133)
!164 = !DILocation(line: 75, column: 9, scope: !133)
!165 = !DILocation(line: 77, column: 1, scope: !129)
