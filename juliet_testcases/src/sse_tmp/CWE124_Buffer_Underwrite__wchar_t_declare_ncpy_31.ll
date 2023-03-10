; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_31.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !31
  store i32* %add.ptr, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  store i32* %0, i32** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !37, metadata !DIExpression()), !dbg !38
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !39
  store i32* %1, i32** %data2, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !44
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx5, align 4, !dbg !46
  %2 = load i32*, i32** %data2, align 8, !dbg !47
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call7 = call i32* @wcsncpy(i32* %2, i32* %arraydecay6, i64 99) #4, !dbg !49
  %3 = load i32*, i32** %data2, align 8, !dbg !50
  %arrayidx8 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !50
  store i32 0, i32* %arrayidx8, align 4, !dbg !51
  %4 = load i32*, i32** %data2, align 8, !dbg !52
  call void @printWLine(i32* %4), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_31_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #4, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #4, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_31_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_31_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !83
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !84
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !87
  store i32* %arraydecay1, i32** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !89, metadata !DIExpression()), !dbg !91
  %0 = load i32*, i32** %data, align 8, !dbg !92
  store i32* %0, i32** %dataCopy, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !93, metadata !DIExpression()), !dbg !94
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !95
  store i32* %1, i32** %data2, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !99
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !100
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx5, align 4, !dbg !102
  %2 = load i32*, i32** %data2, align 8, !dbg !103
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !104
  %call7 = call i32* @wcsncpy(i32* %2, i32* %arraydecay6, i64 99) #4, !dbg !105
  %3 = load i32*, i32** %data2, align 8, !dbg !106
  %arrayidx8 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !106
  store i32 0, i32* %arrayidx8, align 4, !dbg !107
  %4 = load i32*, i32** %data2, align 8, !dbg !108
  call void @printWLine(i32* %4), !dbg !109
  ret void, !dbg !110
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 13, scope: !11)
!27 = !DILocation(line: 27, column: 5, scope: !11)
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 28, column: 23, scope: !11)
!30 = !DILocation(line: 30, column: 12, scope: !11)
!31 = !DILocation(line: 30, column: 23, scope: !11)
!32 = !DILocation(line: 30, column: 10, scope: !11)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !12, line: 32, type: !16)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!35 = !DILocation(line: 32, column: 19, scope: !34)
!36 = !DILocation(line: 32, column: 30, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 33, type: !16)
!38 = !DILocation(line: 33, column: 19, scope: !34)
!39 = !DILocation(line: 33, column: 26, scope: !34)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 35, type: !22)
!41 = distinct !DILexicalBlock(scope: !34, file: !12, line: 34, column: 9)
!42 = !DILocation(line: 35, column: 21, scope: !41)
!43 = !DILocation(line: 36, column: 21, scope: !41)
!44 = !DILocation(line: 36, column: 13, scope: !41)
!45 = !DILocation(line: 37, column: 13, scope: !41)
!46 = !DILocation(line: 37, column: 27, scope: !41)
!47 = !DILocation(line: 39, column: 21, scope: !41)
!48 = !DILocation(line: 39, column: 27, scope: !41)
!49 = !DILocation(line: 39, column: 13, scope: !41)
!50 = !DILocation(line: 41, column: 13, scope: !41)
!51 = !DILocation(line: 41, column: 25, scope: !41)
!52 = !DILocation(line: 42, column: 24, scope: !41)
!53 = !DILocation(line: 42, column: 13, scope: !41)
!54 = !DILocation(line: 45, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_31_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 78, column: 5, scope: !55)
!57 = !DILocation(line: 79, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !59, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!19, !19, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 90, type: !19)
!65 = !DILocation(line: 90, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 90, type: !61)
!67 = !DILocation(line: 90, column: 27, scope: !58)
!68 = !DILocation(line: 93, column: 22, scope: !58)
!69 = !DILocation(line: 93, column: 12, scope: !58)
!70 = !DILocation(line: 93, column: 5, scope: !58)
!71 = !DILocation(line: 95, column: 5, scope: !58)
!72 = !DILocation(line: 96, column: 5, scope: !58)
!73 = !DILocation(line: 97, column: 5, scope: !58)
!74 = !DILocation(line: 100, column: 5, scope: !58)
!75 = !DILocation(line: 101, column: 5, scope: !58)
!76 = !DILocation(line: 102, column: 5, scope: !58)
!77 = !DILocation(line: 104, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 54, type: !16)
!80 = !DILocation(line: 54, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !12, line: 55, type: !22)
!82 = !DILocation(line: 55, column: 13, scope: !78)
!83 = !DILocation(line: 56, column: 13, scope: !78)
!84 = !DILocation(line: 56, column: 5, scope: !78)
!85 = !DILocation(line: 57, column: 5, scope: !78)
!86 = !DILocation(line: 57, column: 23, scope: !78)
!87 = !DILocation(line: 59, column: 12, scope: !78)
!88 = !DILocation(line: 59, column: 10, scope: !78)
!89 = !DILocalVariable(name: "dataCopy", scope: !90, file: !12, line: 61, type: !16)
!90 = distinct !DILexicalBlock(scope: !78, file: !12, line: 60, column: 5)
!91 = !DILocation(line: 61, column: 19, scope: !90)
!92 = !DILocation(line: 61, column: 30, scope: !90)
!93 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 62, type: !16)
!94 = !DILocation(line: 62, column: 19, scope: !90)
!95 = !DILocation(line: 62, column: 26, scope: !90)
!96 = !DILocalVariable(name: "source", scope: !97, file: !12, line: 64, type: !22)
!97 = distinct !DILexicalBlock(scope: !90, file: !12, line: 63, column: 9)
!98 = !DILocation(line: 64, column: 21, scope: !97)
!99 = !DILocation(line: 65, column: 21, scope: !97)
!100 = !DILocation(line: 65, column: 13, scope: !97)
!101 = !DILocation(line: 66, column: 13, scope: !97)
!102 = !DILocation(line: 66, column: 27, scope: !97)
!103 = !DILocation(line: 68, column: 21, scope: !97)
!104 = !DILocation(line: 68, column: 27, scope: !97)
!105 = !DILocation(line: 68, column: 13, scope: !97)
!106 = !DILocation(line: 70, column: 13, scope: !97)
!107 = !DILocation(line: 70, column: 25, scope: !97)
!108 = !DILocation(line: 71, column: 24, scope: !97)
!109 = !DILocation(line: 71, column: 13, scope: !97)
!110 = !DILocation(line: 74, column: 1, scope: !78)
