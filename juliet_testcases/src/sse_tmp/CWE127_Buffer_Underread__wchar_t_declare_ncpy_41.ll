; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_41_badSink(i32* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !27
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !28
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !31
  %0 = load i32*, i32** %data.addr, align 8, !dbg !32
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !33
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !34
  %call4 = call i32* @wcsncpy(i32* %arraydecay1, i32* %0, i64 %call3) #5, !dbg !35
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !36
  store i32 0, i32* %arrayidx5, align 4, !dbg !37
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  call void @printWLine(i32* %arraydecay6), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_41_bad() #0 !dbg !41 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !46, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !48
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !49
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !52
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !53
  store i32* %add.ptr, i32** %data, align 8, !dbg !54
  %0 = load i32*, i32** %data, align 8, !dbg !55
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_41_badSink(i32* %0), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_41_goodG2BSink(i32* %data) #0 !dbg !58 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !61, metadata !DIExpression()), !dbg !63
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !65
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !66
  store i32 0, i32* %arrayidx, align 4, !dbg !67
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !68
  %0 = load i32*, i32** %data.addr, align 8, !dbg !69
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !70
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !71
  %call4 = call i32* @wcsncpy(i32* %arraydecay1, i32* %0, i64 %call3) #5, !dbg !72
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !73
  store i32 0, i32* %arrayidx5, align 4, !dbg !74
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  call void @printWLine(i32* %arraydecay6), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_41_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #5, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #5, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_41_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_41_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !107
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !110
  store i32* %arraydecay1, i32** %data, align 8, !dbg !111
  %0 = load i32*, i32** %data, align 8, !dbg !112
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_41_goodG2BSink(i32* %0), !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!20 = !DILocation(line: 23, column: 73, scope: !11)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !12, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 26, column: 17, scope: !22)
!27 = !DILocation(line: 27, column: 17, scope: !22)
!28 = !DILocation(line: 27, column: 9, scope: !22)
!29 = !DILocation(line: 28, column: 9, scope: !22)
!30 = !DILocation(line: 28, column: 21, scope: !22)
!31 = !DILocation(line: 30, column: 17, scope: !22)
!32 = !DILocation(line: 30, column: 23, scope: !22)
!33 = !DILocation(line: 30, column: 36, scope: !22)
!34 = !DILocation(line: 30, column: 29, scope: !22)
!35 = !DILocation(line: 30, column: 9, scope: !22)
!36 = !DILocation(line: 32, column: 9, scope: !22)
!37 = !DILocation(line: 32, column: 21, scope: !22)
!38 = !DILocation(line: 33, column: 20, scope: !22)
!39 = !DILocation(line: 33, column: 9, scope: !22)
!40 = !DILocation(line: 35, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_41_bad", scope: !12, file: !12, line: 37, type: !42, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{null}
!44 = !DILocalVariable(name: "data", scope: !41, file: !12, line: 39, type: !15)
!45 = !DILocation(line: 39, column: 15, scope: !41)
!46 = !DILocalVariable(name: "dataBuffer", scope: !41, file: !12, line: 40, type: !23)
!47 = !DILocation(line: 40, column: 13, scope: !41)
!48 = !DILocation(line: 41, column: 13, scope: !41)
!49 = !DILocation(line: 41, column: 5, scope: !41)
!50 = !DILocation(line: 42, column: 5, scope: !41)
!51 = !DILocation(line: 42, column: 23, scope: !41)
!52 = !DILocation(line: 44, column: 12, scope: !41)
!53 = !DILocation(line: 44, column: 23, scope: !41)
!54 = !DILocation(line: 44, column: 10, scope: !41)
!55 = !DILocation(line: 45, column: 62, scope: !41)
!56 = !DILocation(line: 45, column: 5, scope: !41)
!57 = !DILocation(line: 46, column: 1, scope: !41)
!58 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_41_goodG2BSink", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", arg: 1, scope: !58, file: !12, line: 52, type: !15)
!60 = !DILocation(line: 52, column: 77, scope: !58)
!61 = !DILocalVariable(name: "dest", scope: !62, file: !12, line: 55, type: !23)
!62 = distinct !DILexicalBlock(scope: !58, file: !12, line: 54, column: 5)
!63 = !DILocation(line: 55, column: 17, scope: !62)
!64 = !DILocation(line: 56, column: 17, scope: !62)
!65 = !DILocation(line: 56, column: 9, scope: !62)
!66 = !DILocation(line: 57, column: 9, scope: !62)
!67 = !DILocation(line: 57, column: 21, scope: !62)
!68 = !DILocation(line: 59, column: 17, scope: !62)
!69 = !DILocation(line: 59, column: 23, scope: !62)
!70 = !DILocation(line: 59, column: 36, scope: !62)
!71 = !DILocation(line: 59, column: 29, scope: !62)
!72 = !DILocation(line: 59, column: 9, scope: !62)
!73 = !DILocation(line: 61, column: 9, scope: !62)
!74 = !DILocation(line: 61, column: 21, scope: !62)
!75 = !DILocation(line: 62, column: 20, scope: !62)
!76 = !DILocation(line: 62, column: 9, scope: !62)
!77 = !DILocation(line: 64, column: 1, scope: !58)
!78 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_41_good", scope: !12, file: !12, line: 78, type: !42, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 80, column: 5, scope: !78)
!80 = !DILocation(line: 81, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 93, type: !82, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!18, !18, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !12, line: 93, type: !18)
!88 = !DILocation(line: 93, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !12, line: 93, type: !84)
!90 = !DILocation(line: 93, column: 27, scope: !81)
!91 = !DILocation(line: 96, column: 22, scope: !81)
!92 = !DILocation(line: 96, column: 12, scope: !81)
!93 = !DILocation(line: 96, column: 5, scope: !81)
!94 = !DILocation(line: 98, column: 5, scope: !81)
!95 = !DILocation(line: 99, column: 5, scope: !81)
!96 = !DILocation(line: 100, column: 5, scope: !81)
!97 = !DILocation(line: 103, column: 5, scope: !81)
!98 = !DILocation(line: 104, column: 5, scope: !81)
!99 = !DILocation(line: 105, column: 5, scope: !81)
!100 = !DILocation(line: 107, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !42, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 69, type: !15)
!103 = !DILocation(line: 69, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !12, line: 70, type: !23)
!105 = !DILocation(line: 70, column: 13, scope: !101)
!106 = !DILocation(line: 71, column: 13, scope: !101)
!107 = !DILocation(line: 71, column: 5, scope: !101)
!108 = !DILocation(line: 72, column: 5, scope: !101)
!109 = !DILocation(line: 72, column: 23, scope: !101)
!110 = !DILocation(line: 74, column: 12, scope: !101)
!111 = !DILocation(line: 74, column: 10, scope: !101)
!112 = !DILocation(line: 75, column: 66, scope: !101)
!113 = !DILocation(line: 75, column: 5, scope: !101)
!114 = !DILocation(line: 76, column: 1, scope: !101)
