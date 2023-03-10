; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_15_bad() #0 !dbg !15 {
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
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !30
  store i32* %add.ptr, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !39
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %5 = load i32*, i32** %data, align 8, !dbg !43
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !45
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %5, i64 %call5) #5, !dbg !46
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx7, align 4, !dbg !48
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  call void @printWLine(i32* %arraydecay8), !dbg !50
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
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_15_good() #0 !dbg !52 {
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
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_15_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_15_bad(), !dbg !73
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
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 400, align 16, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %dataBuffer, align 8, !dbg !80
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !84
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  store i32* %4, i32** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !92
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !93
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !94
  store i32 0, i32* %arrayidx2, align 4, !dbg !95
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !98
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !99
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %5, i64 %call5) #5, !dbg !100
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx7, align 4, !dbg !102
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !103
  call void @printWLine(i32* %arraydecay8), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 400, align 16, !dbg !111
  %1 = bitcast i8* %0 to i32*, !dbg !112
  store i32* %1, i32** %dataBuffer, align 8, !dbg !110
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !114
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  store i32* %4, i32** %data, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !123
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx2, align 4, !dbg !125
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  %5 = load i32*, i32** %data, align 8, !dbg !127
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  %call5 = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !129
  %call6 = call i32* @wcsncpy(i32* %arraydecay3, i32* %5, i64 %call5) #5, !dbg !130
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx7, align 4, !dbg !132
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !133
  call void @printWLine(i32* %arraydecay8), !dbg !134
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
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_15_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!29 = !DILocation(line: 33, column: 16, scope: !15)
!30 = !DILocation(line: 33, column: 27, scope: !15)
!31 = !DILocation(line: 33, column: 14, scope: !15)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !16, line: 41, type: !34)
!33 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 41, column: 17, scope: !33)
!38 = !DILocation(line: 42, column: 17, scope: !33)
!39 = !DILocation(line: 42, column: 9, scope: !33)
!40 = !DILocation(line: 43, column: 9, scope: !33)
!41 = !DILocation(line: 43, column: 21, scope: !33)
!42 = !DILocation(line: 45, column: 17, scope: !33)
!43 = !DILocation(line: 45, column: 23, scope: !33)
!44 = !DILocation(line: 45, column: 36, scope: !33)
!45 = !DILocation(line: 45, column: 29, scope: !33)
!46 = !DILocation(line: 45, column: 9, scope: !33)
!47 = !DILocation(line: 47, column: 9, scope: !33)
!48 = !DILocation(line: 47, column: 21, scope: !33)
!49 = !DILocation(line: 48, column: 20, scope: !33)
!50 = !DILocation(line: 48, column: 9, scope: !33)
!51 = !DILocation(line: 50, column: 1, scope: !15)
!52 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_15_good", scope: !16, file: !16, line: 116, type: !17, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 118, column: 5, scope: !52)
!54 = !DILocation(line: 119, column: 5, scope: !52)
!55 = !DILocation(line: 120, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 132, type: !57, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!7, !7, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !16, line: 132, type: !7)
!63 = !DILocation(line: 132, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !16, line: 132, type: !59)
!65 = !DILocation(line: 132, column: 27, scope: !56)
!66 = !DILocation(line: 135, column: 22, scope: !56)
!67 = !DILocation(line: 135, column: 12, scope: !56)
!68 = !DILocation(line: 135, column: 5, scope: !56)
!69 = !DILocation(line: 137, column: 5, scope: !56)
!70 = !DILocation(line: 138, column: 5, scope: !56)
!71 = !DILocation(line: 139, column: 5, scope: !56)
!72 = !DILocation(line: 142, column: 5, scope: !56)
!73 = !DILocation(line: 143, column: 5, scope: !56)
!74 = !DILocation(line: 144, column: 5, scope: !56)
!75 = !DILocation(line: 146, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !16, line: 59, type: !4)
!78 = !DILocation(line: 59, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !16, line: 60, type: !4)
!80 = !DILocation(line: 60, column: 15, scope: !76)
!81 = !DILocation(line: 60, column: 39, scope: !76)
!82 = !DILocation(line: 60, column: 28, scope: !76)
!83 = !DILocation(line: 61, column: 13, scope: !76)
!84 = !DILocation(line: 61, column: 5, scope: !76)
!85 = !DILocation(line: 62, column: 5, scope: !76)
!86 = !DILocation(line: 62, column: 23, scope: !76)
!87 = !DILocation(line: 71, column: 16, scope: !76)
!88 = !DILocation(line: 71, column: 14, scope: !76)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !16, line: 75, type: !34)
!90 = distinct !DILexicalBlock(scope: !76, file: !16, line: 74, column: 5)
!91 = !DILocation(line: 75, column: 17, scope: !90)
!92 = !DILocation(line: 76, column: 17, scope: !90)
!93 = !DILocation(line: 76, column: 9, scope: !90)
!94 = !DILocation(line: 77, column: 9, scope: !90)
!95 = !DILocation(line: 77, column: 21, scope: !90)
!96 = !DILocation(line: 79, column: 17, scope: !90)
!97 = !DILocation(line: 79, column: 23, scope: !90)
!98 = !DILocation(line: 79, column: 36, scope: !90)
!99 = !DILocation(line: 79, column: 29, scope: !90)
!100 = !DILocation(line: 79, column: 9, scope: !90)
!101 = !DILocation(line: 81, column: 9, scope: !90)
!102 = !DILocation(line: 81, column: 21, scope: !90)
!103 = !DILocation(line: 82, column: 20, scope: !90)
!104 = !DILocation(line: 82, column: 9, scope: !90)
!105 = !DILocation(line: 84, column: 1, scope: !76)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !16, line: 89, type: !4)
!108 = !DILocation(line: 89, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !16, line: 90, type: !4)
!110 = !DILocation(line: 90, column: 15, scope: !106)
!111 = !DILocation(line: 90, column: 39, scope: !106)
!112 = !DILocation(line: 90, column: 28, scope: !106)
!113 = !DILocation(line: 91, column: 13, scope: !106)
!114 = !DILocation(line: 91, column: 5, scope: !106)
!115 = !DILocation(line: 92, column: 5, scope: !106)
!116 = !DILocation(line: 92, column: 23, scope: !106)
!117 = !DILocation(line: 97, column: 16, scope: !106)
!118 = !DILocation(line: 97, column: 14, scope: !106)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !16, line: 105, type: !34)
!120 = distinct !DILexicalBlock(scope: !106, file: !16, line: 104, column: 5)
!121 = !DILocation(line: 105, column: 17, scope: !120)
!122 = !DILocation(line: 106, column: 17, scope: !120)
!123 = !DILocation(line: 106, column: 9, scope: !120)
!124 = !DILocation(line: 107, column: 9, scope: !120)
!125 = !DILocation(line: 107, column: 21, scope: !120)
!126 = !DILocation(line: 109, column: 17, scope: !120)
!127 = !DILocation(line: 109, column: 23, scope: !120)
!128 = !DILocation(line: 109, column: 36, scope: !120)
!129 = !DILocation(line: 109, column: 29, scope: !120)
!130 = !DILocation(line: 109, column: 9, scope: !120)
!131 = !DILocation(line: 111, column: 9, scope: !120)
!132 = !DILocation(line: 111, column: 21, scope: !120)
!133 = !DILocation(line: 112, column: 20, scope: !120)
!134 = !DILocation(line: 112, column: 9, scope: !120)
!135 = !DILocation(line: 114, column: 1, scope: !106)
