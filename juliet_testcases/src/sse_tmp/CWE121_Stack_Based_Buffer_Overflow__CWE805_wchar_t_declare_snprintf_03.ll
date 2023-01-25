; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_03.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_03_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !40
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx2, align 4, !dbg !43
  %1 = load i32*, i32** %data, align 8, !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %1, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay3) #4, !dbg !46
  %2 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %2), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_03_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #4, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #4, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_03_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_03_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !81
  store i32* %arraydecay, i32** %data, align 8, !dbg !84
  %0 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !90
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !91
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !92
  store i32 0, i32* %arrayidx2, align 4, !dbg !93
  %1 = load i32*, i32** %data, align 8, !dbg !94
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !95
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %1, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay3) #4, !dbg !96
  %2 = load i32*, i32** %data, align 8, !dbg !97
  call void @printWLine(i32* %2), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay, i32** %data, align 8, !dbg !110
  %0 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !116
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !117
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx2, align 4, !dbg !119
  %1 = load i32*, i32** %data, align 8, !dbg !120
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !121
  %call4 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %1, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay3) #4, !dbg !122
  %2 = load i32*, i32** %data, align 8, !dbg !123
  call void @printWLine(i32* %2), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_03.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_03_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_03.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 32, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 32, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 13, scope: !11)
!31 = !DILocation(line: 38, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !12, line: 35, column: 5)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 8)
!34 = !DILocation(line: 38, column: 14, scope: !32)
!35 = !DILocation(line: 39, column: 9, scope: !32)
!36 = !DILocation(line: 39, column: 17, scope: !32)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 42, type: !27)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!39 = !DILocation(line: 42, column: 17, scope: !38)
!40 = !DILocation(line: 43, column: 17, scope: !38)
!41 = !DILocation(line: 43, column: 9, scope: !38)
!42 = !DILocation(line: 44, column: 9, scope: !38)
!43 = !DILocation(line: 44, column: 23, scope: !38)
!44 = !DILocation(line: 46, column: 18, scope: !38)
!45 = !DILocation(line: 46, column: 36, scope: !38)
!46 = !DILocation(line: 46, column: 9, scope: !38)
!47 = !DILocation(line: 47, column: 20, scope: !38)
!48 = !DILocation(line: 47, column: 9, scope: !38)
!49 = !DILocation(line: 49, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_03_good", scope: !12, file: !12, line: 104, type: !13, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 106, column: 5, scope: !50)
!52 = !DILocation(line: 107, column: 5, scope: !50)
!53 = !DILocation(line: 108, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 120, type: !55, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!19, !19, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 120, type: !19)
!61 = !DILocation(line: 120, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 120, type: !57)
!63 = !DILocation(line: 120, column: 27, scope: !54)
!64 = !DILocation(line: 123, column: 22, scope: !54)
!65 = !DILocation(line: 123, column: 12, scope: !54)
!66 = !DILocation(line: 123, column: 5, scope: !54)
!67 = !DILocation(line: 125, column: 5, scope: !54)
!68 = !DILocation(line: 126, column: 5, scope: !54)
!69 = !DILocation(line: 127, column: 5, scope: !54)
!70 = !DILocation(line: 130, column: 5, scope: !54)
!71 = !DILocation(line: 131, column: 5, scope: !54)
!72 = !DILocation(line: 132, column: 5, scope: !54)
!73 = !DILocation(line: 134, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 58, type: !16)
!76 = !DILocation(line: 58, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !12, line: 59, type: !22)
!78 = !DILocation(line: 59, column: 13, scope: !74)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !12, line: 60, type: !27)
!80 = !DILocation(line: 60, column: 13, scope: !74)
!81 = !DILocation(line: 69, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !12, line: 67, column: 5)
!83 = distinct !DILexicalBlock(scope: !74, file: !12, line: 61, column: 8)
!84 = !DILocation(line: 69, column: 14, scope: !82)
!85 = !DILocation(line: 70, column: 9, scope: !82)
!86 = !DILocation(line: 70, column: 17, scope: !82)
!87 = !DILocalVariable(name: "source", scope: !88, file: !12, line: 73, type: !27)
!88 = distinct !DILexicalBlock(scope: !74, file: !12, line: 72, column: 5)
!89 = !DILocation(line: 73, column: 17, scope: !88)
!90 = !DILocation(line: 74, column: 17, scope: !88)
!91 = !DILocation(line: 74, column: 9, scope: !88)
!92 = !DILocation(line: 75, column: 9, scope: !88)
!93 = !DILocation(line: 75, column: 23, scope: !88)
!94 = !DILocation(line: 77, column: 18, scope: !88)
!95 = !DILocation(line: 77, column: 36, scope: !88)
!96 = !DILocation(line: 77, column: 9, scope: !88)
!97 = !DILocation(line: 78, column: 20, scope: !88)
!98 = !DILocation(line: 78, column: 9, scope: !88)
!99 = !DILocation(line: 80, column: 1, scope: !74)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 85, type: !16)
!102 = !DILocation(line: 85, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !12, line: 86, type: !22)
!104 = !DILocation(line: 86, column: 13, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !12, line: 87, type: !27)
!106 = !DILocation(line: 87, column: 13, scope: !100)
!107 = !DILocation(line: 91, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !109, file: !12, line: 89, column: 5)
!109 = distinct !DILexicalBlock(scope: !100, file: !12, line: 88, column: 8)
!110 = !DILocation(line: 91, column: 14, scope: !108)
!111 = !DILocation(line: 92, column: 9, scope: !108)
!112 = !DILocation(line: 92, column: 17, scope: !108)
!113 = !DILocalVariable(name: "source", scope: !114, file: !12, line: 95, type: !27)
!114 = distinct !DILexicalBlock(scope: !100, file: !12, line: 94, column: 5)
!115 = !DILocation(line: 95, column: 17, scope: !114)
!116 = !DILocation(line: 96, column: 17, scope: !114)
!117 = !DILocation(line: 96, column: 9, scope: !114)
!118 = !DILocation(line: 97, column: 9, scope: !114)
!119 = !DILocation(line: 97, column: 23, scope: !114)
!120 = !DILocation(line: 99, column: 18, scope: !114)
!121 = !DILocation(line: 99, column: 36, scope: !114)
!122 = !DILocation(line: 99, column: 9, scope: !114)
!123 = !DILocation(line: 100, column: 20, scope: !114)
!124 = !DILocation(line: 100, column: 9, scope: !114)
!125 = !DILocation(line: 102, column: 1, scope: !100)
