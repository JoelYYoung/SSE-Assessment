; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_02.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_02_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !33
  store i32* %add.ptr, i32** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !39
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx4, align 4, !dbg !41
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %0 = load i32*, i32** %data, align 8, !dbg !43
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !45
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %0, i64 %call7) #5, !dbg !46
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx9, align 4, !dbg !48
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  call void @printWLine(i32* %arraydecay10), !dbg !50
  ret void, !dbg !51
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
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_02_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_02_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_02_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !81
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !82
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !85
  store i32* %arraydecay1, i32** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !92
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !93
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !94
  store i32 0, i32* %arrayidx4, align 4, !dbg !95
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !96
  %0 = load i32*, i32** %data, align 8, !dbg !97
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !98
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !99
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %0, i64 %call7) #5, !dbg !100
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx9, align 4, !dbg !102
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !103
  call void @printWLine(i32* %arraydecay10), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !111
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !112
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !115
  store i32* %arraydecay1, i32** %data, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !123
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx4, align 4, !dbg !125
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  %0 = load i32*, i32** %data, align 8, !dbg !127
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !129
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %0, i64 %call7) #5, !dbg !130
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx9, align 4, !dbg !132
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !133
  call void @printWLine(i32* %arraydecay10), !dbg !134
  ret void, !dbg !135
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_02_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_02.c", directory: "/home/joelyang/SSE-Assessment")
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
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 30, column: 5)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!33 = !DILocation(line: 32, column: 27, scope: !31)
!34 = !DILocation(line: 32, column: 14, scope: !31)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 35, type: !22)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!37 = !DILocation(line: 35, column: 17, scope: !36)
!38 = !DILocation(line: 36, column: 17, scope: !36)
!39 = !DILocation(line: 36, column: 9, scope: !36)
!40 = !DILocation(line: 37, column: 9, scope: !36)
!41 = !DILocation(line: 37, column: 21, scope: !36)
!42 = !DILocation(line: 39, column: 17, scope: !36)
!43 = !DILocation(line: 39, column: 23, scope: !36)
!44 = !DILocation(line: 39, column: 36, scope: !36)
!45 = !DILocation(line: 39, column: 29, scope: !36)
!46 = !DILocation(line: 39, column: 9, scope: !36)
!47 = !DILocation(line: 41, column: 9, scope: !36)
!48 = !DILocation(line: 41, column: 21, scope: !36)
!49 = !DILocation(line: 42, column: 20, scope: !36)
!50 = !DILocation(line: 42, column: 9, scope: !36)
!51 = !DILocation(line: 44, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_02_good", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 105, column: 5, scope: !52)
!54 = !DILocation(line: 106, column: 5, scope: !52)
!55 = !DILocation(line: 107, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !57, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!19, !19, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 119, type: !19)
!63 = !DILocation(line: 119, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 119, type: !59)
!65 = !DILocation(line: 119, column: 27, scope: !56)
!66 = !DILocation(line: 122, column: 22, scope: !56)
!67 = !DILocation(line: 122, column: 12, scope: !56)
!68 = !DILocation(line: 122, column: 5, scope: !56)
!69 = !DILocation(line: 124, column: 5, scope: !56)
!70 = !DILocation(line: 125, column: 5, scope: !56)
!71 = !DILocation(line: 126, column: 5, scope: !56)
!72 = !DILocation(line: 129, column: 5, scope: !56)
!73 = !DILocation(line: 130, column: 5, scope: !56)
!74 = !DILocation(line: 131, column: 5, scope: !56)
!75 = !DILocation(line: 133, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 53, type: !16)
!78 = !DILocation(line: 53, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !12, line: 54, type: !22)
!80 = !DILocation(line: 54, column: 13, scope: !76)
!81 = !DILocation(line: 55, column: 13, scope: !76)
!82 = !DILocation(line: 55, column: 5, scope: !76)
!83 = !DILocation(line: 56, column: 5, scope: !76)
!84 = !DILocation(line: 56, column: 23, scope: !76)
!85 = !DILocation(line: 65, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !87, file: !12, line: 63, column: 5)
!87 = distinct !DILexicalBlock(scope: !76, file: !12, line: 57, column: 8)
!88 = !DILocation(line: 65, column: 14, scope: !86)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !12, line: 68, type: !22)
!90 = distinct !DILexicalBlock(scope: !76, file: !12, line: 67, column: 5)
!91 = !DILocation(line: 68, column: 17, scope: !90)
!92 = !DILocation(line: 69, column: 17, scope: !90)
!93 = !DILocation(line: 69, column: 9, scope: !90)
!94 = !DILocation(line: 70, column: 9, scope: !90)
!95 = !DILocation(line: 70, column: 21, scope: !90)
!96 = !DILocation(line: 72, column: 17, scope: !90)
!97 = !DILocation(line: 72, column: 23, scope: !90)
!98 = !DILocation(line: 72, column: 36, scope: !90)
!99 = !DILocation(line: 72, column: 29, scope: !90)
!100 = !DILocation(line: 72, column: 9, scope: !90)
!101 = !DILocation(line: 74, column: 9, scope: !90)
!102 = !DILocation(line: 74, column: 21, scope: !90)
!103 = !DILocation(line: 75, column: 20, scope: !90)
!104 = !DILocation(line: 75, column: 9, scope: !90)
!105 = !DILocation(line: 77, column: 1, scope: !76)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 82, type: !16)
!108 = !DILocation(line: 82, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !12, line: 83, type: !22)
!110 = !DILocation(line: 83, column: 13, scope: !106)
!111 = !DILocation(line: 84, column: 13, scope: !106)
!112 = !DILocation(line: 84, column: 5, scope: !106)
!113 = !DILocation(line: 85, column: 5, scope: !106)
!114 = !DILocation(line: 85, column: 23, scope: !106)
!115 = !DILocation(line: 89, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !117, file: !12, line: 87, column: 5)
!117 = distinct !DILexicalBlock(scope: !106, file: !12, line: 86, column: 8)
!118 = !DILocation(line: 89, column: 14, scope: !116)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !12, line: 92, type: !22)
!120 = distinct !DILexicalBlock(scope: !106, file: !12, line: 91, column: 5)
!121 = !DILocation(line: 92, column: 17, scope: !120)
!122 = !DILocation(line: 93, column: 17, scope: !120)
!123 = !DILocation(line: 93, column: 9, scope: !120)
!124 = !DILocation(line: 94, column: 9, scope: !120)
!125 = !DILocation(line: 94, column: 21, scope: !120)
!126 = !DILocation(line: 96, column: 17, scope: !120)
!127 = !DILocation(line: 96, column: 23, scope: !120)
!128 = !DILocation(line: 96, column: 36, scope: !120)
!129 = !DILocation(line: 96, column: 29, scope: !120)
!130 = !DILocation(line: 96, column: 9, scope: !120)
!131 = !DILocation(line: 98, column: 9, scope: !120)
!132 = !DILocation(line: 98, column: 21, scope: !120)
!133 = !DILocation(line: 99, column: 20, scope: !120)
!134 = !DILocation(line: 99, column: 9, scope: !120)
!135 = !DILocation(line: 101, column: 1, scope: !106)
