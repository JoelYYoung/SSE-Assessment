; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_44_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !38
  %7 = load i32*, i32** %data, align 8, !dbg !39
  call void %6(i32* %7), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx, align 4, !dbg !53
  %0 = load i32*, i32** %data.addr, align 8, !dbg !54
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %call2 = call i32* @wcscat(i32* %0, i32* %arraydecay1) #4, !dbg !56
  %1 = load i32*, i32** %data.addr, align 8, !dbg !57
  call void @printWLine(i32* %1), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_44_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #4, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #4, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_44_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_44_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !86, metadata !DIExpression()), !dbg !87
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = alloca i8, i64 200, align 16, !dbg !90
  %1 = bitcast i8* %0 to i32*, !dbg !91
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %2 = alloca i8, i64 400, align 16, !dbg !94
  %3 = bitcast i8* %2 to i32*, !dbg !95
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !93
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !96
  store i32* %4, i32** %data, align 8, !dbg !97
  %5 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  %6 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !100
  %7 = load i32*, i32** %data, align 8, !dbg !101
  call void %6(i32* %7), !dbg !100
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !103 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !110
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %0 = load i32*, i32** %data.addr, align 8, !dbg !113
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !114
  %call2 = call i32* @wcscat(i32* %0, i32* %arraydecay1) #4, !dbg !115
  %1 = load i32*, i32** %data.addr, align 8, !dbg !116
  call void @printWLine(i32* %1), !dbg !117
  ret void, !dbg !118
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_44_bad", scope: !16, file: !16, line: 35, type: !17, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_44.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 37, type: !4)
!20 = !DILocation(line: 37, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 39, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 39, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 40, type: !4)
!27 = !DILocation(line: 40, column: 15, scope: !15)
!28 = !DILocation(line: 40, column: 42, scope: !15)
!29 = !DILocation(line: 40, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 41, type: !4)
!31 = !DILocation(line: 41, column: 15, scope: !15)
!32 = !DILocation(line: 41, column: 43, scope: !15)
!33 = !DILocation(line: 41, column: 32, scope: !15)
!34 = !DILocation(line: 44, column: 12, scope: !15)
!35 = !DILocation(line: 44, column: 10, scope: !15)
!36 = !DILocation(line: 45, column: 5, scope: !15)
!37 = !DILocation(line: 45, column: 13, scope: !15)
!38 = !DILocation(line: 47, column: 5, scope: !15)
!39 = !DILocation(line: 47, column: 13, scope: !15)
!40 = !DILocation(line: 48, column: 1, scope: !15)
!41 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !16, line: 23, type: !4)
!43 = !DILocation(line: 23, column: 31, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !16, line: 26, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !16, line: 25, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 26, column: 17, scope: !45)
!50 = !DILocation(line: 27, column: 17, scope: !45)
!51 = !DILocation(line: 27, column: 9, scope: !45)
!52 = !DILocation(line: 28, column: 9, scope: !45)
!53 = !DILocation(line: 28, column: 23, scope: !45)
!54 = !DILocation(line: 30, column: 16, scope: !45)
!55 = !DILocation(line: 30, column: 22, scope: !45)
!56 = !DILocation(line: 30, column: 9, scope: !45)
!57 = !DILocation(line: 31, column: 20, scope: !45)
!58 = !DILocation(line: 31, column: 9, scope: !45)
!59 = !DILocation(line: 33, column: 1, scope: !41)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_44_good", scope: !16, file: !16, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 81, column: 5, scope: !60)
!62 = !DILocation(line: 82, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 93, type: !64, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !16, line: 93, type: !7)
!70 = !DILocation(line: 93, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !16, line: 93, type: !66)
!72 = !DILocation(line: 93, column: 27, scope: !63)
!73 = !DILocation(line: 96, column: 22, scope: !63)
!74 = !DILocation(line: 96, column: 12, scope: !63)
!75 = !DILocation(line: 96, column: 5, scope: !63)
!76 = !DILocation(line: 98, column: 5, scope: !63)
!77 = !DILocation(line: 99, column: 5, scope: !63)
!78 = !DILocation(line: 100, column: 5, scope: !63)
!79 = !DILocation(line: 103, column: 5, scope: !63)
!80 = !DILocation(line: 104, column: 5, scope: !63)
!81 = !DILocation(line: 105, column: 5, scope: !63)
!82 = !DILocation(line: 107, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 67, type: !17, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !16, line: 69, type: !4)
!85 = !DILocation(line: 69, column: 15, scope: !83)
!86 = !DILocalVariable(name: "funcPtr", scope: !83, file: !16, line: 70, type: !22)
!87 = !DILocation(line: 70, column: 12, scope: !83)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !16, line: 71, type: !4)
!89 = !DILocation(line: 71, column: 15, scope: !83)
!90 = !DILocation(line: 71, column: 42, scope: !83)
!91 = !DILocation(line: 71, column: 31, scope: !83)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !16, line: 72, type: !4)
!93 = !DILocation(line: 72, column: 15, scope: !83)
!94 = !DILocation(line: 72, column: 43, scope: !83)
!95 = !DILocation(line: 72, column: 32, scope: !83)
!96 = !DILocation(line: 74, column: 12, scope: !83)
!97 = !DILocation(line: 74, column: 10, scope: !83)
!98 = !DILocation(line: 75, column: 5, scope: !83)
!99 = !DILocation(line: 75, column: 13, scope: !83)
!100 = !DILocation(line: 76, column: 5, scope: !83)
!101 = !DILocation(line: 76, column: 13, scope: !83)
!102 = !DILocation(line: 77, column: 1, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 55, type: !23, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", arg: 1, scope: !103, file: !16, line: 55, type: !4)
!105 = !DILocation(line: 55, column: 35, scope: !103)
!106 = !DILocalVariable(name: "source", scope: !107, file: !16, line: 58, type: !46)
!107 = distinct !DILexicalBlock(scope: !103, file: !16, line: 57, column: 5)
!108 = !DILocation(line: 58, column: 17, scope: !107)
!109 = !DILocation(line: 59, column: 17, scope: !107)
!110 = !DILocation(line: 59, column: 9, scope: !107)
!111 = !DILocation(line: 60, column: 9, scope: !107)
!112 = !DILocation(line: 60, column: 23, scope: !107)
!113 = !DILocation(line: 62, column: 16, scope: !107)
!114 = !DILocation(line: 62, column: 22, scope: !107)
!115 = !DILocation(line: 62, column: 9, scope: !107)
!116 = !DILocation(line: 63, column: 20, scope: !107)
!117 = !DILocation(line: 63, column: 9, scope: !107)
!118 = !DILocation(line: 65, column: 1, scope: !103)
