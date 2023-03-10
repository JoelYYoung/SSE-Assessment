; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_15_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !30
  store i32* %add.ptr, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !38
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !39
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !42
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call4 = call i32* @wcscpy(i32* %5, i32* %arraydecay3) #4, !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* %6), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_15_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #4, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #4, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_15_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_15_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 400, align 16, !dbg !77
  %1 = bitcast i8* %0 to i32*, !dbg !78
  store i32* %1, i32** %dataBuffer, align 8, !dbg !76
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !80
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !81
  store i32 0, i32* %arrayidx, align 4, !dbg !82
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  store i32* %4, i32** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !88
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !89
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !90
  store i32 0, i32* %arrayidx2, align 4, !dbg !91
  %5 = load i32*, i32** %data, align 8, !dbg !92
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !93
  %call4 = call i32* @wcscpy(i32* %5, i32* %arraydecay3) #4, !dbg !94
  %6 = load i32*, i32** %data, align 8, !dbg !95
  call void @printWLine(i32* %6), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 400, align 16, !dbg !103
  %1 = bitcast i8* %0 to i32*, !dbg !104
  store i32* %1, i32** %dataBuffer, align 8, !dbg !102
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !105
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !106
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  store i32* %4, i32** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !114
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !115
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx2, align 4, !dbg !117
  %5 = load i32*, i32** %data, align 8, !dbg !118
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !119
  %call4 = call i32* @wcscpy(i32* %5, i32* %arraydecay3) #4, !dbg !120
  %6 = load i32*, i32** %data, align 8, !dbg !121
  call void @printWLine(i32* %6), !dbg !122
  ret void, !dbg !123
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_15_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!32 = !DILocalVariable(name: "source", scope: !33, file: !16, line: 41, type: !34)
!33 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 41, column: 17, scope: !33)
!38 = !DILocation(line: 42, column: 17, scope: !33)
!39 = !DILocation(line: 42, column: 9, scope: !33)
!40 = !DILocation(line: 43, column: 9, scope: !33)
!41 = !DILocation(line: 43, column: 23, scope: !33)
!42 = !DILocation(line: 45, column: 16, scope: !33)
!43 = !DILocation(line: 45, column: 22, scope: !33)
!44 = !DILocation(line: 45, column: 9, scope: !33)
!45 = !DILocation(line: 46, column: 20, scope: !33)
!46 = !DILocation(line: 46, column: 9, scope: !33)
!47 = !DILocation(line: 48, column: 1, scope: !15)
!48 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_cpy_15_good", scope: !16, file: !16, line: 110, type: !17, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 112, column: 5, scope: !48)
!50 = !DILocation(line: 113, column: 5, scope: !48)
!51 = !DILocation(line: 114, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 126, type: !53, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!7, !7, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !16, line: 126, type: !7)
!59 = !DILocation(line: 126, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !16, line: 126, type: !55)
!61 = !DILocation(line: 126, column: 27, scope: !52)
!62 = !DILocation(line: 129, column: 22, scope: !52)
!63 = !DILocation(line: 129, column: 12, scope: !52)
!64 = !DILocation(line: 129, column: 5, scope: !52)
!65 = !DILocation(line: 131, column: 5, scope: !52)
!66 = !DILocation(line: 132, column: 5, scope: !52)
!67 = !DILocation(line: 133, column: 5, scope: !52)
!68 = !DILocation(line: 136, column: 5, scope: !52)
!69 = !DILocation(line: 137, column: 5, scope: !52)
!70 = !DILocation(line: 138, column: 5, scope: !52)
!71 = !DILocation(line: 140, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !16, line: 57, type: !4)
!74 = !DILocation(line: 57, column: 15, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !16, line: 58, type: !4)
!76 = !DILocation(line: 58, column: 15, scope: !72)
!77 = !DILocation(line: 58, column: 39, scope: !72)
!78 = !DILocation(line: 58, column: 28, scope: !72)
!79 = !DILocation(line: 59, column: 13, scope: !72)
!80 = !DILocation(line: 59, column: 5, scope: !72)
!81 = !DILocation(line: 60, column: 5, scope: !72)
!82 = !DILocation(line: 60, column: 23, scope: !72)
!83 = !DILocation(line: 69, column: 16, scope: !72)
!84 = !DILocation(line: 69, column: 14, scope: !72)
!85 = !DILocalVariable(name: "source", scope: !86, file: !16, line: 73, type: !34)
!86 = distinct !DILexicalBlock(scope: !72, file: !16, line: 72, column: 5)
!87 = !DILocation(line: 73, column: 17, scope: !86)
!88 = !DILocation(line: 74, column: 17, scope: !86)
!89 = !DILocation(line: 74, column: 9, scope: !86)
!90 = !DILocation(line: 75, column: 9, scope: !86)
!91 = !DILocation(line: 75, column: 23, scope: !86)
!92 = !DILocation(line: 77, column: 16, scope: !86)
!93 = !DILocation(line: 77, column: 22, scope: !86)
!94 = !DILocation(line: 77, column: 9, scope: !86)
!95 = !DILocation(line: 78, column: 20, scope: !86)
!96 = !DILocation(line: 78, column: 9, scope: !86)
!97 = !DILocation(line: 80, column: 1, scope: !72)
!98 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 83, type: !17, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !16, line: 85, type: !4)
!100 = !DILocation(line: 85, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !16, line: 86, type: !4)
!102 = !DILocation(line: 86, column: 15, scope: !98)
!103 = !DILocation(line: 86, column: 39, scope: !98)
!104 = !DILocation(line: 86, column: 28, scope: !98)
!105 = !DILocation(line: 87, column: 13, scope: !98)
!106 = !DILocation(line: 87, column: 5, scope: !98)
!107 = !DILocation(line: 88, column: 5, scope: !98)
!108 = !DILocation(line: 88, column: 23, scope: !98)
!109 = !DILocation(line: 93, column: 16, scope: !98)
!110 = !DILocation(line: 93, column: 14, scope: !98)
!111 = !DILocalVariable(name: "source", scope: !112, file: !16, line: 101, type: !34)
!112 = distinct !DILexicalBlock(scope: !98, file: !16, line: 100, column: 5)
!113 = !DILocation(line: 101, column: 17, scope: !112)
!114 = !DILocation(line: 102, column: 17, scope: !112)
!115 = !DILocation(line: 102, column: 9, scope: !112)
!116 = !DILocation(line: 103, column: 9, scope: !112)
!117 = !DILocation(line: 103, column: 23, scope: !112)
!118 = !DILocation(line: 105, column: 16, scope: !112)
!119 = !DILocation(line: 105, column: 22, scope: !112)
!120 = !DILocation(line: 105, column: 9, scope: !112)
!121 = !DILocation(line: 106, column: 20, scope: !112)
!122 = !DILocation(line: 106, column: 9, scope: !112)
!123 = !DILocation(line: 108, column: 1, scope: !98)
