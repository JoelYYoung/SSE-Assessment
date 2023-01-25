; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_02_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !41
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !42
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !43
  store i32 0, i32* %arrayidx1, align 4, !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !45
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call3 = call i32* @wcsncpy(i32* %6, i32* %arraydecay2, i64 99) #4, !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !48
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !48
  store i32 0, i32* %arrayidx4, align 4, !dbg !49
  %8 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %8), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_02_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #4, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #4, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_02_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_02_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 200, align 16, !dbg !82
  %1 = bitcast i8* %0 to i32*, !dbg !83
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %2 = alloca i8, i64 400, align 16, !dbg !86
  %3 = bitcast i8* %2 to i32*, !dbg !87
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !85
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !88
  store i32* %4, i32** %data, align 8, !dbg !91
  %5 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !97
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !98
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !99
  store i32 0, i32* %arrayidx1, align 4, !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !101
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !102
  %call3 = call i32* @wcsncpy(i32* %6, i32* %arraydecay2, i64 99) #4, !dbg !103
  %7 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !104
  store i32 0, i32* %arrayidx4, align 4, !dbg !105
  %8 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* %8), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 200, align 16, !dbg !114
  %1 = bitcast i8* %0 to i32*, !dbg !115
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %2 = alloca i8, i64 400, align 16, !dbg !118
  %3 = bitcast i8* %2 to i32*, !dbg !119
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !117
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !120
  store i32* %4, i32** %data, align 8, !dbg !123
  %5 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !129
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !130
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx1, align 4, !dbg !132
  %6 = load i32*, i32** %data, align 8, !dbg !133
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !134
  %call3 = call i32* @wcsncpy(i32* %6, i32* %arraydecay2, i64 99) #4, !dbg !135
  %7 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !136
  store i32 0, i32* %arrayidx4, align 4, !dbg !137
  %8 = load i32*, i32** %data, align 8, !dbg !138
  call void @printWLine(i32* %8), !dbg !139
  ret void, !dbg !140
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_02.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_02_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !16, line: 29, column: 5)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!32 = !DILocation(line: 32, column: 14, scope: !30)
!33 = !DILocation(line: 33, column: 9, scope: !30)
!34 = !DILocation(line: 33, column: 17, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !16, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 36, column: 17, scope: !36)
!41 = !DILocation(line: 37, column: 17, scope: !36)
!42 = !DILocation(line: 37, column: 9, scope: !36)
!43 = !DILocation(line: 38, column: 9, scope: !36)
!44 = !DILocation(line: 38, column: 23, scope: !36)
!45 = !DILocation(line: 40, column: 17, scope: !36)
!46 = !DILocation(line: 40, column: 23, scope: !36)
!47 = !DILocation(line: 40, column: 9, scope: !36)
!48 = !DILocation(line: 41, column: 9, scope: !36)
!49 = !DILocation(line: 41, column: 21, scope: !36)
!50 = !DILocation(line: 42, column: 20, scope: !36)
!51 = !DILocation(line: 42, column: 9, scope: !36)
!52 = !DILocation(line: 44, column: 1, scope: !15)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_02_good", scope: !16, file: !16, line: 101, type: !17, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 103, column: 5, scope: !53)
!55 = !DILocation(line: 104, column: 5, scope: !53)
!56 = !DILocation(line: 105, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 117, type: !58, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!7, !7, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !16, line: 117, type: !7)
!64 = !DILocation(line: 117, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !16, line: 117, type: !60)
!66 = !DILocation(line: 117, column: 27, scope: !57)
!67 = !DILocation(line: 120, column: 22, scope: !57)
!68 = !DILocation(line: 120, column: 12, scope: !57)
!69 = !DILocation(line: 120, column: 5, scope: !57)
!70 = !DILocation(line: 122, column: 5, scope: !57)
!71 = !DILocation(line: 123, column: 5, scope: !57)
!72 = !DILocation(line: 124, column: 5, scope: !57)
!73 = !DILocation(line: 127, column: 5, scope: !57)
!74 = !DILocation(line: 128, column: 5, scope: !57)
!75 = !DILocation(line: 129, column: 5, scope: !57)
!76 = !DILocation(line: 131, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !16, line: 53, type: !4)
!79 = !DILocation(line: 53, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !16, line: 54, type: !4)
!81 = !DILocation(line: 54, column: 15, scope: !77)
!82 = !DILocation(line: 54, column: 42, scope: !77)
!83 = !DILocation(line: 54, column: 31, scope: !77)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !16, line: 55, type: !4)
!85 = !DILocation(line: 55, column: 15, scope: !77)
!86 = !DILocation(line: 55, column: 43, scope: !77)
!87 = !DILocation(line: 55, column: 32, scope: !77)
!88 = !DILocation(line: 64, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !90, file: !16, line: 62, column: 5)
!90 = distinct !DILexicalBlock(scope: !77, file: !16, line: 56, column: 8)
!91 = !DILocation(line: 64, column: 14, scope: !89)
!92 = !DILocation(line: 65, column: 9, scope: !89)
!93 = !DILocation(line: 65, column: 17, scope: !89)
!94 = !DILocalVariable(name: "source", scope: !95, file: !16, line: 68, type: !37)
!95 = distinct !DILexicalBlock(scope: !77, file: !16, line: 67, column: 5)
!96 = !DILocation(line: 68, column: 17, scope: !95)
!97 = !DILocation(line: 69, column: 17, scope: !95)
!98 = !DILocation(line: 69, column: 9, scope: !95)
!99 = !DILocation(line: 70, column: 9, scope: !95)
!100 = !DILocation(line: 70, column: 23, scope: !95)
!101 = !DILocation(line: 72, column: 17, scope: !95)
!102 = !DILocation(line: 72, column: 23, scope: !95)
!103 = !DILocation(line: 72, column: 9, scope: !95)
!104 = !DILocation(line: 73, column: 9, scope: !95)
!105 = !DILocation(line: 73, column: 21, scope: !95)
!106 = !DILocation(line: 74, column: 20, scope: !95)
!107 = !DILocation(line: 74, column: 9, scope: !95)
!108 = !DILocation(line: 76, column: 1, scope: !77)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !16, line: 81, type: !4)
!111 = !DILocation(line: 81, column: 15, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !16, line: 82, type: !4)
!113 = !DILocation(line: 82, column: 15, scope: !109)
!114 = !DILocation(line: 82, column: 42, scope: !109)
!115 = !DILocation(line: 82, column: 31, scope: !109)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !16, line: 83, type: !4)
!117 = !DILocation(line: 83, column: 15, scope: !109)
!118 = !DILocation(line: 83, column: 43, scope: !109)
!119 = !DILocation(line: 83, column: 32, scope: !109)
!120 = !DILocation(line: 87, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !122, file: !16, line: 85, column: 5)
!122 = distinct !DILexicalBlock(scope: !109, file: !16, line: 84, column: 8)
!123 = !DILocation(line: 87, column: 14, scope: !121)
!124 = !DILocation(line: 88, column: 9, scope: !121)
!125 = !DILocation(line: 88, column: 17, scope: !121)
!126 = !DILocalVariable(name: "source", scope: !127, file: !16, line: 91, type: !37)
!127 = distinct !DILexicalBlock(scope: !109, file: !16, line: 90, column: 5)
!128 = !DILocation(line: 91, column: 17, scope: !127)
!129 = !DILocation(line: 92, column: 17, scope: !127)
!130 = !DILocation(line: 92, column: 9, scope: !127)
!131 = !DILocation(line: 93, column: 9, scope: !127)
!132 = !DILocation(line: 93, column: 23, scope: !127)
!133 = !DILocation(line: 95, column: 17, scope: !127)
!134 = !DILocation(line: 95, column: 23, scope: !127)
!135 = !DILocation(line: 95, column: 9, scope: !127)
!136 = !DILocation(line: 96, column: 9, scope: !127)
!137 = !DILocation(line: 96, column: 21, scope: !127)
!138 = !DILocation(line: 97, column: 20, scope: !127)
!139 = !DILocation(line: 97, column: 9, scope: !127)
!140 = !DILocation(line: 99, column: 1, scope: !109)
