; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_32.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !38
  %1 = load i32*, i32** %0, align 8, !dbg !39
  store i32* %1, i32** %data1, align 8, !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !40
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay2, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data1, align 8, !dbg !42
  %2 = load i32*, i32** %data1, align 8, !dbg !43
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !44
  store i32* %2, i32** %3, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !46, metadata !DIExpression()), !dbg !48
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !49
  %5 = load i32*, i32** %4, align 8, !dbg !50
  store i32* %5, i32** %data3, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call5 = call i32* @wmemset(i32* %arraydecay4, i32 67, i64 99) #4, !dbg !55
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx6, align 4, !dbg !57
  %6 = load i32*, i32** %data3, align 8, !dbg !58
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !59
  %call8 = call i32* @wcsncpy(i32* %6, i32* %arraydecay7, i64 99) #4, !dbg !60
  %7 = load i32*, i32** %data3, align 8, !dbg !61
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !61
  store i32 0, i32* %arrayidx9, align 4, !dbg !62
  %8 = load i32*, i32** %data3, align 8, !dbg !63
  call void @printWLine(i32* %8), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_32_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #4, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #4, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_32_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_32_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !92, metadata !DIExpression()), !dbg !93
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !94, metadata !DIExpression()), !dbg !95
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !98
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !99
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !102, metadata !DIExpression()), !dbg !104
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !105
  %1 = load i32*, i32** %0, align 8, !dbg !106
  store i32* %1, i32** %data1, align 8, !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay2, i32** %data1, align 8, !dbg !108
  %2 = load i32*, i32** %data1, align 8, !dbg !109
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !110
  store i32* %2, i32** %3, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !112, metadata !DIExpression()), !dbg !114
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !115
  %5 = load i32*, i32** %4, align 8, !dbg !116
  store i32* %5, i32** %data3, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !120
  %call5 = call i32* @wmemset(i32* %arraydecay4, i32 67, i64 99) #4, !dbg !121
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx6, align 4, !dbg !123
  %6 = load i32*, i32** %data3, align 8, !dbg !124
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !125
  %call8 = call i32* @wcsncpy(i32* %6, i32* %arraydecay7, i64 99) #4, !dbg !126
  %7 = load i32*, i32** %data3, align 8, !dbg !127
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !127
  store i32 0, i32* %arrayidx9, align 4, !dbg !128
  %8 = load i32*, i32** %data3, align 8, !dbg !129
  call void @printWLine(i32* %8), !dbg !130
  ret void, !dbg !131
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !11)
!24 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 28, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 28, column: 13, scope: !11)
!31 = !DILocation(line: 29, column: 13, scope: !11)
!32 = !DILocation(line: 29, column: 5, scope: !11)
!33 = !DILocation(line: 30, column: 5, scope: !11)
!34 = !DILocation(line: 30, column: 23, scope: !11)
!35 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 32, type: !16)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!37 = !DILocation(line: 32, column: 19, scope: !36)
!38 = !DILocation(line: 32, column: 27, scope: !36)
!39 = !DILocation(line: 32, column: 26, scope: !36)
!40 = !DILocation(line: 34, column: 16, scope: !36)
!41 = !DILocation(line: 34, column: 27, scope: !36)
!42 = !DILocation(line: 34, column: 14, scope: !36)
!43 = !DILocation(line: 35, column: 21, scope: !36)
!44 = !DILocation(line: 35, column: 10, scope: !36)
!45 = !DILocation(line: 35, column: 19, scope: !36)
!46 = !DILocalVariable(name: "data", scope: !47, file: !12, line: 38, type: !16)
!47 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!48 = !DILocation(line: 38, column: 19, scope: !47)
!49 = !DILocation(line: 38, column: 27, scope: !47)
!50 = !DILocation(line: 38, column: 26, scope: !47)
!51 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 40, type: !27)
!52 = distinct !DILexicalBlock(scope: !47, file: !12, line: 39, column: 9)
!53 = !DILocation(line: 40, column: 21, scope: !52)
!54 = !DILocation(line: 41, column: 21, scope: !52)
!55 = !DILocation(line: 41, column: 13, scope: !52)
!56 = !DILocation(line: 42, column: 13, scope: !52)
!57 = !DILocation(line: 42, column: 27, scope: !52)
!58 = !DILocation(line: 44, column: 21, scope: !52)
!59 = !DILocation(line: 44, column: 27, scope: !52)
!60 = !DILocation(line: 44, column: 13, scope: !52)
!61 = !DILocation(line: 46, column: 13, scope: !52)
!62 = !DILocation(line: 46, column: 25, scope: !52)
!63 = !DILocation(line: 47, column: 24, scope: !52)
!64 = !DILocation(line: 47, column: 13, scope: !52)
!65 = !DILocation(line: 50, column: 1, scope: !11)
!66 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_32_good", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 88, column: 5, scope: !66)
!68 = !DILocation(line: 89, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 100, type: !70, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!19, !19, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !12, line: 100, type: !19)
!76 = !DILocation(line: 100, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !12, line: 100, type: !72)
!78 = !DILocation(line: 100, column: 27, scope: !69)
!79 = !DILocation(line: 103, column: 22, scope: !69)
!80 = !DILocation(line: 103, column: 12, scope: !69)
!81 = !DILocation(line: 103, column: 5, scope: !69)
!82 = !DILocation(line: 105, column: 5, scope: !69)
!83 = !DILocation(line: 106, column: 5, scope: !69)
!84 = !DILocation(line: 107, column: 5, scope: !69)
!85 = !DILocation(line: 110, column: 5, scope: !69)
!86 = !DILocation(line: 111, column: 5, scope: !69)
!87 = !DILocation(line: 112, column: 5, scope: !69)
!88 = !DILocation(line: 114, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 59, type: !16)
!91 = !DILocation(line: 59, column: 15, scope: !89)
!92 = !DILocalVariable(name: "dataPtr1", scope: !89, file: !12, line: 60, type: !22)
!93 = !DILocation(line: 60, column: 16, scope: !89)
!94 = !DILocalVariable(name: "dataPtr2", scope: !89, file: !12, line: 61, type: !22)
!95 = !DILocation(line: 61, column: 16, scope: !89)
!96 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !12, line: 62, type: !27)
!97 = !DILocation(line: 62, column: 13, scope: !89)
!98 = !DILocation(line: 63, column: 13, scope: !89)
!99 = !DILocation(line: 63, column: 5, scope: !89)
!100 = !DILocation(line: 64, column: 5, scope: !89)
!101 = !DILocation(line: 64, column: 23, scope: !89)
!102 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 66, type: !16)
!103 = distinct !DILexicalBlock(scope: !89, file: !12, line: 65, column: 5)
!104 = !DILocation(line: 66, column: 19, scope: !103)
!105 = !DILocation(line: 66, column: 27, scope: !103)
!106 = !DILocation(line: 66, column: 26, scope: !103)
!107 = !DILocation(line: 68, column: 16, scope: !103)
!108 = !DILocation(line: 68, column: 14, scope: !103)
!109 = !DILocation(line: 69, column: 21, scope: !103)
!110 = !DILocation(line: 69, column: 10, scope: !103)
!111 = !DILocation(line: 69, column: 19, scope: !103)
!112 = !DILocalVariable(name: "data", scope: !113, file: !12, line: 72, type: !16)
!113 = distinct !DILexicalBlock(scope: !89, file: !12, line: 71, column: 5)
!114 = !DILocation(line: 72, column: 19, scope: !113)
!115 = !DILocation(line: 72, column: 27, scope: !113)
!116 = !DILocation(line: 72, column: 26, scope: !113)
!117 = !DILocalVariable(name: "source", scope: !118, file: !12, line: 74, type: !27)
!118 = distinct !DILexicalBlock(scope: !113, file: !12, line: 73, column: 9)
!119 = !DILocation(line: 74, column: 21, scope: !118)
!120 = !DILocation(line: 75, column: 21, scope: !118)
!121 = !DILocation(line: 75, column: 13, scope: !118)
!122 = !DILocation(line: 76, column: 13, scope: !118)
!123 = !DILocation(line: 76, column: 27, scope: !118)
!124 = !DILocation(line: 78, column: 21, scope: !118)
!125 = !DILocation(line: 78, column: 27, scope: !118)
!126 = !DILocation(line: 78, column: 13, scope: !118)
!127 = !DILocation(line: 80, column: 13, scope: !118)
!128 = !DILocation(line: 80, column: 25, scope: !118)
!129 = !DILocation(line: 81, column: 24, scope: !118)
!130 = !DILocation(line: 81, column: 13, scope: !118)
!131 = !DILocation(line: 84, column: 1, scope: !89)
