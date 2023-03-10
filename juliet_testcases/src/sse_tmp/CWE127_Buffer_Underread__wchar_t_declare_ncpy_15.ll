; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_15_bad() #0 !dbg !11 {
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
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !31
  store i32* %add.ptr, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !35
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !37
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !38
  store i32 0, i32* %arrayidx4, align 4, !dbg !39
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !40
  %0 = load i32*, i32** %data, align 8, !dbg !41
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !43
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %0, i64 %call7) #5, !dbg !44
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx9, align 4, !dbg !46
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  call void @printWLine(i32* %arraydecay10), !dbg !48
  ret void, !dbg !49
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
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_15_good() #0 !dbg !50 {
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
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_15_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE127_Buffer_Underread__wchar_t_declare_ncpy_15_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !79
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !80
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !81
  store i32 0, i32* %arrayidx, align 4, !dbg !82
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !83
  store i32* %arraydecay1, i32** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !85, metadata !DIExpression()), !dbg !87
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !88
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !89
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !90
  store i32 0, i32* %arrayidx4, align 4, !dbg !91
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !92
  %0 = load i32*, i32** %data, align 8, !dbg !93
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !94
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !95
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %0, i64 %call7) #5, !dbg !96
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !97
  store i32 0, i32* %arrayidx9, align 4, !dbg !98
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !99
  call void @printWLine(i32* %arraydecay10), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !107
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #5, !dbg !108
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !111
  store i32* %arraydecay1, i32** %data, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !116
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #5, !dbg !117
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx4, align 4, !dbg !119
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  %0 = load i32*, i32** %data, align 8, !dbg !121
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !123
  %call8 = call i32* @wcsncpy(i32* %arraydecay5, i32* %0, i64 %call7) #5, !dbg !124
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx9, align 4, !dbg !126
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  call void @printWLine(i32* %arraydecay10), !dbg !128
  ret void, !dbg !129
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!30 = !DILocation(line: 33, column: 16, scope: !11)
!31 = !DILocation(line: 33, column: 27, scope: !11)
!32 = !DILocation(line: 33, column: 14, scope: !11)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !12, line: 41, type: !22)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!35 = !DILocation(line: 41, column: 17, scope: !34)
!36 = !DILocation(line: 42, column: 17, scope: !34)
!37 = !DILocation(line: 42, column: 9, scope: !34)
!38 = !DILocation(line: 43, column: 9, scope: !34)
!39 = !DILocation(line: 43, column: 21, scope: !34)
!40 = !DILocation(line: 45, column: 17, scope: !34)
!41 = !DILocation(line: 45, column: 23, scope: !34)
!42 = !DILocation(line: 45, column: 36, scope: !34)
!43 = !DILocation(line: 45, column: 29, scope: !34)
!44 = !DILocation(line: 45, column: 9, scope: !34)
!45 = !DILocation(line: 47, column: 9, scope: !34)
!46 = !DILocation(line: 47, column: 21, scope: !34)
!47 = !DILocation(line: 48, column: 20, scope: !34)
!48 = !DILocation(line: 48, column: 9, scope: !34)
!49 = !DILocation(line: 50, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_ncpy_15_good", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 118, column: 5, scope: !50)
!52 = !DILocation(line: 119, column: 5, scope: !50)
!53 = !DILocation(line: 120, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 132, type: !55, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!19, !19, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 132, type: !19)
!61 = !DILocation(line: 132, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 132, type: !57)
!63 = !DILocation(line: 132, column: 27, scope: !54)
!64 = !DILocation(line: 135, column: 22, scope: !54)
!65 = !DILocation(line: 135, column: 12, scope: !54)
!66 = !DILocation(line: 135, column: 5, scope: !54)
!67 = !DILocation(line: 137, column: 5, scope: !54)
!68 = !DILocation(line: 138, column: 5, scope: !54)
!69 = !DILocation(line: 139, column: 5, scope: !54)
!70 = !DILocation(line: 142, column: 5, scope: !54)
!71 = !DILocation(line: 143, column: 5, scope: !54)
!72 = !DILocation(line: 144, column: 5, scope: !54)
!73 = !DILocation(line: 146, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 59, type: !16)
!76 = !DILocation(line: 59, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !12, line: 60, type: !22)
!78 = !DILocation(line: 60, column: 13, scope: !74)
!79 = !DILocation(line: 61, column: 13, scope: !74)
!80 = !DILocation(line: 61, column: 5, scope: !74)
!81 = !DILocation(line: 62, column: 5, scope: !74)
!82 = !DILocation(line: 62, column: 23, scope: !74)
!83 = !DILocation(line: 71, column: 16, scope: !74)
!84 = !DILocation(line: 71, column: 14, scope: !74)
!85 = !DILocalVariable(name: "dest", scope: !86, file: !12, line: 75, type: !22)
!86 = distinct !DILexicalBlock(scope: !74, file: !12, line: 74, column: 5)
!87 = !DILocation(line: 75, column: 17, scope: !86)
!88 = !DILocation(line: 76, column: 17, scope: !86)
!89 = !DILocation(line: 76, column: 9, scope: !86)
!90 = !DILocation(line: 77, column: 9, scope: !86)
!91 = !DILocation(line: 77, column: 21, scope: !86)
!92 = !DILocation(line: 79, column: 17, scope: !86)
!93 = !DILocation(line: 79, column: 23, scope: !86)
!94 = !DILocation(line: 79, column: 36, scope: !86)
!95 = !DILocation(line: 79, column: 29, scope: !86)
!96 = !DILocation(line: 79, column: 9, scope: !86)
!97 = !DILocation(line: 81, column: 9, scope: !86)
!98 = !DILocation(line: 81, column: 21, scope: !86)
!99 = !DILocation(line: 82, column: 20, scope: !86)
!100 = !DILocation(line: 82, column: 9, scope: !86)
!101 = !DILocation(line: 84, column: 1, scope: !74)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 89, type: !16)
!104 = !DILocation(line: 89, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !12, line: 90, type: !22)
!106 = !DILocation(line: 90, column: 13, scope: !102)
!107 = !DILocation(line: 91, column: 13, scope: !102)
!108 = !DILocation(line: 91, column: 5, scope: !102)
!109 = !DILocation(line: 92, column: 5, scope: !102)
!110 = !DILocation(line: 92, column: 23, scope: !102)
!111 = !DILocation(line: 97, column: 16, scope: !102)
!112 = !DILocation(line: 97, column: 14, scope: !102)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !12, line: 105, type: !22)
!114 = distinct !DILexicalBlock(scope: !102, file: !12, line: 104, column: 5)
!115 = !DILocation(line: 105, column: 17, scope: !114)
!116 = !DILocation(line: 106, column: 17, scope: !114)
!117 = !DILocation(line: 106, column: 9, scope: !114)
!118 = !DILocation(line: 107, column: 9, scope: !114)
!119 = !DILocation(line: 107, column: 21, scope: !114)
!120 = !DILocation(line: 109, column: 17, scope: !114)
!121 = !DILocation(line: 109, column: 23, scope: !114)
!122 = !DILocation(line: 109, column: 36, scope: !114)
!123 = !DILocation(line: 109, column: 29, scope: !114)
!124 = !DILocation(line: 109, column: 9, scope: !114)
!125 = !DILocation(line: 111, column: 9, scope: !114)
!126 = !DILocation(line: 111, column: 21, scope: !114)
!127 = !DILocation(line: 112, column: 20, scope: !114)
!128 = !DILocation(line: 112, column: 9, scope: !114)
!129 = !DILocation(line: 114, column: 1, scope: !102)
