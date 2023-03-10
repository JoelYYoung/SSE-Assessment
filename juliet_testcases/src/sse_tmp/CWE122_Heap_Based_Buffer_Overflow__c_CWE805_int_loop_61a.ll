; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %0 = load i32*, i32** %data, align 8, !dbg !20
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61b_badSource(i32* %0), !dbg !21
  store i32* %call, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %2, 100, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !44
  %4 = load i32, i32* %arrayidx, align 4, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %6 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !45
  store i32 %4, i32* %arrayidx1, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %7, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !54
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !54
  call void @printIntLine(i32 %9), !dbg !55
  %10 = load i32*, i32** %data, align 8, !dbg !56
  %11 = bitcast i32* %10 to i8*, !dbg !56
  call void @free(i8* %11) #5, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61b_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #5, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #5, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  %0 = load i32*, i32** %data, align 8, !dbg !86
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61b_goodG2BSource(i32* %0), !dbg !87
  store i32* %call, i32** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !91
  call void @llvm.dbg.declare(metadata i64* %i, metadata !92, metadata !DIExpression()), !dbg !94
  store i64 0, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !98
  %cmp = icmp ult i64 %2, 100, !dbg !100
  br i1 %cmp, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !104
  %4 = load i32, i32* %arrayidx, align 4, !dbg !104
  %5 = load i32*, i32** %data, align 8, !dbg !105
  %6 = load i64, i64* %i, align 8, !dbg !106
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !105
  store i32 %4, i32* %arrayidx1, align 4, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !109
  %inc = add i64 %7, 1, !dbg !109
  store i64 %inc, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !113
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !113
  call void @printIntLine(i32 %9), !dbg !114
  %10 = load i32*, i32** %data, align 8, !dbg !115
  %11 = bitcast i32* %10 to i8*, !dbg !115
  call void @free(i8* %11) #5, !dbg !116
  ret void, !dbg !117
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61_bad", scope: !12, file: !12, line: 24, type: !13, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 11, scope: !11)
!19 = !DILocation(line: 27, column: 10, scope: !11)
!20 = !DILocation(line: 28, column: 79, scope: !11)
!21 = !DILocation(line: 28, column: 12, scope: !11)
!22 = !DILocation(line: 28, column: 10, scope: !11)
!23 = !DILocalVariable(name: "source", scope: !24, file: !12, line: 30, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 30, column: 13, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !30, file: !12, line: 32, type: !31)
!30 = distinct !DILexicalBlock(scope: !24, file: !12, line: 31, column: 9)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 32, column: 20, scope: !30)
!35 = !DILocation(line: 34, column: 20, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !12, line: 34, column: 13)
!37 = !DILocation(line: 34, column: 18, scope: !36)
!38 = !DILocation(line: 34, column: 25, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 34, column: 13)
!40 = !DILocation(line: 34, column: 27, scope: !39)
!41 = !DILocation(line: 34, column: 13, scope: !36)
!42 = !DILocation(line: 36, column: 34, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !12, line: 35, column: 13)
!44 = !DILocation(line: 36, column: 27, scope: !43)
!45 = !DILocation(line: 36, column: 17, scope: !43)
!46 = !DILocation(line: 36, column: 22, scope: !43)
!47 = !DILocation(line: 36, column: 25, scope: !43)
!48 = !DILocation(line: 37, column: 13, scope: !43)
!49 = !DILocation(line: 34, column: 35, scope: !39)
!50 = !DILocation(line: 34, column: 13, scope: !39)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 37, column: 13, scope: !36)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 38, column: 26, scope: !30)
!55 = !DILocation(line: 38, column: 13, scope: !30)
!56 = !DILocation(line: 39, column: 18, scope: !30)
!57 = !DILocation(line: 39, column: 13, scope: !30)
!58 = !DILocation(line: 42, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_61_good", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 73, column: 5, scope: !59)
!61 = !DILocation(line: 74, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 86, type: !63, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!17, !17, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 86, type: !17)
!69 = !DILocation(line: 86, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 86, type: !65)
!71 = !DILocation(line: 86, column: 27, scope: !62)
!72 = !DILocation(line: 89, column: 22, scope: !62)
!73 = !DILocation(line: 89, column: 12, scope: !62)
!74 = !DILocation(line: 89, column: 5, scope: !62)
!75 = !DILocation(line: 91, column: 5, scope: !62)
!76 = !DILocation(line: 92, column: 5, scope: !62)
!77 = !DILocation(line: 93, column: 5, scope: !62)
!78 = !DILocation(line: 96, column: 5, scope: !62)
!79 = !DILocation(line: 97, column: 5, scope: !62)
!80 = !DILocation(line: 98, column: 5, scope: !62)
!81 = !DILocation(line: 100, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 53, type: !16)
!84 = !DILocation(line: 53, column: 11, scope: !82)
!85 = !DILocation(line: 54, column: 10, scope: !82)
!86 = !DILocation(line: 55, column: 83, scope: !82)
!87 = !DILocation(line: 55, column: 12, scope: !82)
!88 = !DILocation(line: 55, column: 10, scope: !82)
!89 = !DILocalVariable(name: "source", scope: !90, file: !12, line: 57, type: !25)
!90 = distinct !DILexicalBlock(scope: !82, file: !12, line: 56, column: 5)
!91 = !DILocation(line: 57, column: 13, scope: !90)
!92 = !DILocalVariable(name: "i", scope: !93, file: !12, line: 59, type: !31)
!93 = distinct !DILexicalBlock(scope: !90, file: !12, line: 58, column: 9)
!94 = !DILocation(line: 59, column: 20, scope: !93)
!95 = !DILocation(line: 61, column: 20, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !12, line: 61, column: 13)
!97 = !DILocation(line: 61, column: 18, scope: !96)
!98 = !DILocation(line: 61, column: 25, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !12, line: 61, column: 13)
!100 = !DILocation(line: 61, column: 27, scope: !99)
!101 = !DILocation(line: 61, column: 13, scope: !96)
!102 = !DILocation(line: 63, column: 34, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !12, line: 62, column: 13)
!104 = !DILocation(line: 63, column: 27, scope: !103)
!105 = !DILocation(line: 63, column: 17, scope: !103)
!106 = !DILocation(line: 63, column: 22, scope: !103)
!107 = !DILocation(line: 63, column: 25, scope: !103)
!108 = !DILocation(line: 64, column: 13, scope: !103)
!109 = !DILocation(line: 61, column: 35, scope: !99)
!110 = !DILocation(line: 61, column: 13, scope: !99)
!111 = distinct !{!111, !101, !112, !53}
!112 = !DILocation(line: 64, column: 13, scope: !96)
!113 = !DILocation(line: 65, column: 26, scope: !93)
!114 = !DILocation(line: 65, column: 13, scope: !93)
!115 = !DILocation(line: 66, column: 18, scope: !93)
!116 = !DILocation(line: 66, column: 13, scope: !93)
!117 = !DILocation(line: 69, column: 1, scope: !82)
