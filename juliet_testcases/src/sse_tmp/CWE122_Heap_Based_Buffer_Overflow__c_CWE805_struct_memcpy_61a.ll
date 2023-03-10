; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !25
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61b_badSource(%struct._twoIntsStruct* %0), !dbg !27
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %1, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !50
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !51
  store i32 0, i32* %intOne, align 8, !dbg !52
  %3 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !54
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !55
  store i32 0, i32* %intTwo, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %4, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !63
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !64
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !64
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !64
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !65
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !66
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !67
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !67
  call void @free(i8* %10) #5, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61b_badSource(%struct._twoIntsStruct*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !94, metadata !DIExpression()), !dbg !95
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !96
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !97
  %call = call %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61b_goodG2BSource(%struct._twoIntsStruct* %0), !dbg !98
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i64* %i, metadata !103, metadata !DIExpression()), !dbg !105
  store i64 0, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !109
  %cmp = icmp ult i64 %1, 100, !dbg !111
  br i1 %cmp, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !115
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !116
  store i32 0, i32* %intOne, align 8, !dbg !117
  %3 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !119
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !120
  store i32 0, i32* %intTwo, align 4, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !123
  %inc = add i64 %4, 1, !dbg !123
  store i64 %inc, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !127
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !128
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !128
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !128
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !128
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !129
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !129
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !130
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !131
  call void @free(i8* %10) #5, !dbg !132
  ret void, !dbg !133
}

declare dso_local %struct._twoIntsStruct* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61b_goodG2BSource(%struct._twoIntsStruct*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61_bad", scope: !12, file: !12, line: 24, type: !13, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 26, column: 21, scope: !11)
!25 = !DILocation(line: 27, column: 10, scope: !11)
!26 = !DILocation(line: 28, column: 84, scope: !11)
!27 = !DILocation(line: 28, column: 12, scope: !11)
!28 = !DILocation(line: 28, column: 10, scope: !11)
!29 = !DILocalVariable(name: "source", scope: !30, file: !12, line: 30, type: !31)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 30, column: 23, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !36, file: !12, line: 32, type: !37)
!36 = distinct !DILexicalBlock(scope: !30, file: !12, line: 31, column: 9)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 32, column: 20, scope: !36)
!41 = !DILocation(line: 34, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !12, line: 34, column: 13)
!43 = !DILocation(line: 34, column: 18, scope: !42)
!44 = !DILocation(line: 34, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !12, line: 34, column: 13)
!46 = !DILocation(line: 34, column: 27, scope: !45)
!47 = !DILocation(line: 34, column: 13, scope: !42)
!48 = !DILocation(line: 36, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 35, column: 13)
!50 = !DILocation(line: 36, column: 17, scope: !49)
!51 = !DILocation(line: 36, column: 27, scope: !49)
!52 = !DILocation(line: 36, column: 34, scope: !49)
!53 = !DILocation(line: 37, column: 24, scope: !49)
!54 = !DILocation(line: 37, column: 17, scope: !49)
!55 = !DILocation(line: 37, column: 27, scope: !49)
!56 = !DILocation(line: 37, column: 34, scope: !49)
!57 = !DILocation(line: 38, column: 13, scope: !49)
!58 = !DILocation(line: 34, column: 35, scope: !45)
!59 = !DILocation(line: 34, column: 13, scope: !45)
!60 = distinct !{!60, !47, !61, !62}
!61 = !DILocation(line: 38, column: 13, scope: !42)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 41, column: 16, scope: !30)
!64 = !DILocation(line: 41, column: 9, scope: !30)
!65 = !DILocation(line: 42, column: 26, scope: !30)
!66 = !DILocation(line: 42, column: 9, scope: !30)
!67 = !DILocation(line: 43, column: 14, scope: !30)
!68 = !DILocation(line: 43, column: 9, scope: !30)
!69 = !DILocation(line: 45, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_61_good", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 79, column: 5, scope: !70)
!72 = !DILocation(line: 80, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !74, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!22, !22, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 92, type: !22)
!80 = !DILocation(line: 92, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 92, type: !76)
!82 = !DILocation(line: 92, column: 27, scope: !73)
!83 = !DILocation(line: 95, column: 22, scope: !73)
!84 = !DILocation(line: 95, column: 12, scope: !73)
!85 = !DILocation(line: 95, column: 5, scope: !73)
!86 = !DILocation(line: 97, column: 5, scope: !73)
!87 = !DILocation(line: 98, column: 5, scope: !73)
!88 = !DILocation(line: 99, column: 5, scope: !73)
!89 = !DILocation(line: 102, column: 5, scope: !73)
!90 = !DILocation(line: 103, column: 5, scope: !73)
!91 = !DILocation(line: 104, column: 5, scope: !73)
!92 = !DILocation(line: 106, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 56, type: !16)
!95 = !DILocation(line: 56, column: 21, scope: !93)
!96 = !DILocation(line: 57, column: 10, scope: !93)
!97 = !DILocation(line: 58, column: 88, scope: !93)
!98 = !DILocation(line: 58, column: 12, scope: !93)
!99 = !DILocation(line: 58, column: 10, scope: !93)
!100 = !DILocalVariable(name: "source", scope: !101, file: !12, line: 60, type: !31)
!101 = distinct !DILexicalBlock(scope: !93, file: !12, line: 59, column: 5)
!102 = !DILocation(line: 60, column: 23, scope: !101)
!103 = !DILocalVariable(name: "i", scope: !104, file: !12, line: 62, type: !37)
!104 = distinct !DILexicalBlock(scope: !101, file: !12, line: 61, column: 9)
!105 = !DILocation(line: 62, column: 20, scope: !104)
!106 = !DILocation(line: 64, column: 20, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 64, column: 13)
!108 = !DILocation(line: 64, column: 18, scope: !107)
!109 = !DILocation(line: 64, column: 25, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 64, column: 13)
!111 = !DILocation(line: 64, column: 27, scope: !110)
!112 = !DILocation(line: 64, column: 13, scope: !107)
!113 = !DILocation(line: 66, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 65, column: 13)
!115 = !DILocation(line: 66, column: 17, scope: !114)
!116 = !DILocation(line: 66, column: 27, scope: !114)
!117 = !DILocation(line: 66, column: 34, scope: !114)
!118 = !DILocation(line: 67, column: 24, scope: !114)
!119 = !DILocation(line: 67, column: 17, scope: !114)
!120 = !DILocation(line: 67, column: 27, scope: !114)
!121 = !DILocation(line: 67, column: 34, scope: !114)
!122 = !DILocation(line: 68, column: 13, scope: !114)
!123 = !DILocation(line: 64, column: 35, scope: !110)
!124 = !DILocation(line: 64, column: 13, scope: !110)
!125 = distinct !{!125, !112, !126, !62}
!126 = !DILocation(line: 68, column: 13, scope: !107)
!127 = !DILocation(line: 71, column: 16, scope: !101)
!128 = !DILocation(line: 71, column: 9, scope: !101)
!129 = !DILocation(line: 72, column: 26, scope: !101)
!130 = !DILocation(line: 72, column: 9, scope: !101)
!131 = !DILocation(line: 73, column: 14, scope: !101)
!132 = !DILocation(line: 73, column: 9, scope: !101)
!133 = !DILocation(line: 75, column: 1, scope: !93)
