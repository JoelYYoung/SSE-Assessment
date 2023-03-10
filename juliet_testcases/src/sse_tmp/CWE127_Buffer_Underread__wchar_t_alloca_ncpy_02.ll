; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_02.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_02_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !32
  store i32* %add.ptr, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !40
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx2, align 4, !dbg !43
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !46
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !47
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %5, i64 %call5) #5, !dbg !48
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx7, align 4, !dbg !50
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  call void @printWLine(i32* %arraydecay8), !dbg !52
  ret void, !dbg !53
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
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_02_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
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
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_02_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_02_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 400, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBuffer, align 8, !dbg !82
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !86
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  store i32* %4, i32** %data, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !96
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !97
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !98
  store i32 0, i32* %arrayidx2, align 4, !dbg !99
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !100
  %5 = load i32*, i32** %data, align 8, !dbg !101
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !102
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !103
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %5, i64 %call5) #5, !dbg !104
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !105
  store i32 0, i32* %arrayidx7, align 4, !dbg !106
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !107
  call void @printWLine(i32* %arraydecay8), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 400, align 16, !dbg !115
  %1 = bitcast i8* %0 to i32*, !dbg !116
  store i32* %1, i32** %dataBuffer, align 8, !dbg !114
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !118
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  store i32* %4, i32** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !129
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx2, align 4, !dbg !131
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !132
  %5 = load i32*, i32** %data, align 8, !dbg !133
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !134
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !135
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %5, i64 %call5) #5, !dbg !136
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !137
  store i32 0, i32* %arrayidx7, align 4, !dbg !138
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  call void @printWLine(i32* %arraydecay8), !dbg !140
  ret void, !dbg !141
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_02_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 13, scope: !15)
!26 = !DILocation(line: 27, column: 5, scope: !15)
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILocation(line: 28, column: 23, scope: !15)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !16, line: 30, column: 5)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 8)
!32 = !DILocation(line: 32, column: 27, scope: !30)
!33 = !DILocation(line: 32, column: 14, scope: !30)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !16, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 35, column: 17, scope: !35)
!40 = !DILocation(line: 36, column: 17, scope: !35)
!41 = !DILocation(line: 36, column: 9, scope: !35)
!42 = !DILocation(line: 37, column: 9, scope: !35)
!43 = !DILocation(line: 37, column: 21, scope: !35)
!44 = !DILocation(line: 39, column: 17, scope: !35)
!45 = !DILocation(line: 39, column: 23, scope: !35)
!46 = !DILocation(line: 39, column: 36, scope: !35)
!47 = !DILocation(line: 39, column: 29, scope: !35)
!48 = !DILocation(line: 39, column: 9, scope: !35)
!49 = !DILocation(line: 41, column: 9, scope: !35)
!50 = !DILocation(line: 41, column: 21, scope: !35)
!51 = !DILocation(line: 42, column: 20, scope: !35)
!52 = !DILocation(line: 42, column: 9, scope: !35)
!53 = !DILocation(line: 44, column: 1, scope: !15)
!54 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_02_good", scope: !16, file: !16, line: 103, type: !17, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 105, column: 5, scope: !54)
!56 = !DILocation(line: 106, column: 5, scope: !54)
!57 = !DILocation(line: 107, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 119, type: !59, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !16, line: 119, type: !7)
!65 = !DILocation(line: 119, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !16, line: 119, type: !61)
!67 = !DILocation(line: 119, column: 27, scope: !58)
!68 = !DILocation(line: 122, column: 22, scope: !58)
!69 = !DILocation(line: 122, column: 12, scope: !58)
!70 = !DILocation(line: 122, column: 5, scope: !58)
!71 = !DILocation(line: 124, column: 5, scope: !58)
!72 = !DILocation(line: 125, column: 5, scope: !58)
!73 = !DILocation(line: 126, column: 5, scope: !58)
!74 = !DILocation(line: 129, column: 5, scope: !58)
!75 = !DILocation(line: 130, column: 5, scope: !58)
!76 = !DILocation(line: 131, column: 5, scope: !58)
!77 = !DILocation(line: 133, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !16, line: 53, type: !4)
!80 = !DILocation(line: 53, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !16, line: 54, type: !4)
!82 = !DILocation(line: 54, column: 15, scope: !78)
!83 = !DILocation(line: 54, column: 39, scope: !78)
!84 = !DILocation(line: 54, column: 28, scope: !78)
!85 = !DILocation(line: 55, column: 13, scope: !78)
!86 = !DILocation(line: 55, column: 5, scope: !78)
!87 = !DILocation(line: 56, column: 5, scope: !78)
!88 = !DILocation(line: 56, column: 23, scope: !78)
!89 = !DILocation(line: 65, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !91, file: !16, line: 63, column: 5)
!91 = distinct !DILexicalBlock(scope: !78, file: !16, line: 57, column: 8)
!92 = !DILocation(line: 65, column: 14, scope: !90)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !16, line: 68, type: !36)
!94 = distinct !DILexicalBlock(scope: !78, file: !16, line: 67, column: 5)
!95 = !DILocation(line: 68, column: 17, scope: !94)
!96 = !DILocation(line: 69, column: 17, scope: !94)
!97 = !DILocation(line: 69, column: 9, scope: !94)
!98 = !DILocation(line: 70, column: 9, scope: !94)
!99 = !DILocation(line: 70, column: 21, scope: !94)
!100 = !DILocation(line: 72, column: 17, scope: !94)
!101 = !DILocation(line: 72, column: 23, scope: !94)
!102 = !DILocation(line: 72, column: 36, scope: !94)
!103 = !DILocation(line: 72, column: 29, scope: !94)
!104 = !DILocation(line: 72, column: 9, scope: !94)
!105 = !DILocation(line: 74, column: 9, scope: !94)
!106 = !DILocation(line: 74, column: 21, scope: !94)
!107 = !DILocation(line: 75, column: 20, scope: !94)
!108 = !DILocation(line: 75, column: 9, scope: !94)
!109 = !DILocation(line: 77, column: 1, scope: !78)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !16, line: 82, type: !4)
!112 = !DILocation(line: 82, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !16, line: 83, type: !4)
!114 = !DILocation(line: 83, column: 15, scope: !110)
!115 = !DILocation(line: 83, column: 39, scope: !110)
!116 = !DILocation(line: 83, column: 28, scope: !110)
!117 = !DILocation(line: 84, column: 13, scope: !110)
!118 = !DILocation(line: 84, column: 5, scope: !110)
!119 = !DILocation(line: 85, column: 5, scope: !110)
!120 = !DILocation(line: 85, column: 23, scope: !110)
!121 = !DILocation(line: 89, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !123, file: !16, line: 87, column: 5)
!123 = distinct !DILexicalBlock(scope: !110, file: !16, line: 86, column: 8)
!124 = !DILocation(line: 89, column: 14, scope: !122)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !16, line: 92, type: !36)
!126 = distinct !DILexicalBlock(scope: !110, file: !16, line: 91, column: 5)
!127 = !DILocation(line: 92, column: 17, scope: !126)
!128 = !DILocation(line: 93, column: 17, scope: !126)
!129 = !DILocation(line: 93, column: 9, scope: !126)
!130 = !DILocation(line: 94, column: 9, scope: !126)
!131 = !DILocation(line: 94, column: 21, scope: !126)
!132 = !DILocation(line: 96, column: 17, scope: !126)
!133 = !DILocation(line: 96, column: 23, scope: !126)
!134 = !DILocation(line: 96, column: 36, scope: !126)
!135 = !DILocation(line: 96, column: 29, scope: !126)
!136 = !DILocation(line: 96, column: 9, scope: !126)
!137 = !DILocation(line: 98, column: 9, scope: !126)
!138 = !DILocation(line: 98, column: 21, scope: !126)
!139 = !DILocation(line: 99, column: 20, scope: !126)
!140 = !DILocation(line: 99, column: 9, scope: !126)
!141 = !DILocation(line: 101, column: 1, scope: !110)
