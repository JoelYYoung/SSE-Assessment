; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_44_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 40, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 44, align 16, !dbg !32
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
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !49
  %1 = load i32*, i32** %data.addr, align 8, !dbg !50
  %2 = bitcast i32* %1 to i8*, !dbg !51
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !51
  %3 = bitcast i32* %arraydecay to i8*, !dbg !51
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !52
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !53
  %add = add i64 %call, 1, !dbg !54
  %mul = mul i64 %add, 4, !dbg !55
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 %mul, i1 false), !dbg !51
  %4 = load i32*, i32** %data.addr, align 8, !dbg !56
  call void @printWLine(i32* %4), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_44_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_44_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_44_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !85, metadata !DIExpression()), !dbg !86
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 40, align 16, !dbg !89
  %1 = bitcast i8* %0 to i32*, !dbg !90
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %2 = alloca i8, i64 44, align 16, !dbg !93
  %3 = bitcast i8* %2 to i32*, !dbg !94
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !92
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !95
  store i32* %4, i32** %data, align 8, !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  %6 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !99
  %7 = load i32*, i32** %data, align 8, !dbg !100
  call void %6(i32* %7), !dbg !99
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !102 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !107
  %1 = load i32*, i32** %data.addr, align 8, !dbg !108
  %2 = bitcast i32* %1 to i8*, !dbg !109
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !109
  %3 = bitcast i32* %arraydecay to i8*, !dbg !109
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !110
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !111
  %add = add i64 %call, 1, !dbg !112
  %mul = mul i64 %add, 4, !dbg !113
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 %mul, i1 false), !dbg !109
  %4 = load i32*, i32** %data.addr, align 8, !dbg !114
  call void @printWLine(i32* %4), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_44_bad", scope: !16, file: !16, line: 39, type: !17, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 41, type: !4)
!20 = !DILocation(line: 41, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 43, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 43, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 44, type: !4)
!27 = !DILocation(line: 44, column: 15, scope: !15)
!28 = !DILocation(line: 44, column: 42, scope: !15)
!29 = !DILocation(line: 44, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 45, type: !4)
!31 = !DILocation(line: 45, column: 15, scope: !15)
!32 = !DILocation(line: 45, column: 43, scope: !15)
!33 = !DILocation(line: 45, column: 32, scope: !15)
!34 = !DILocation(line: 48, column: 12, scope: !15)
!35 = !DILocation(line: 48, column: 10, scope: !15)
!36 = !DILocation(line: 49, column: 5, scope: !15)
!37 = !DILocation(line: 49, column: 13, scope: !15)
!38 = !DILocation(line: 51, column: 5, scope: !15)
!39 = !DILocation(line: 51, column: 13, scope: !15)
!40 = !DILocation(line: 52, column: 1, scope: !15)
!41 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 28, type: !23, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !16, line: 28, type: !4)
!43 = !DILocation(line: 28, column: 31, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !16, line: 31, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !16, line: 30, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 11)
!49 = !DILocation(line: 31, column: 17, scope: !45)
!50 = !DILocation(line: 34, column: 17, scope: !45)
!51 = !DILocation(line: 34, column: 9, scope: !45)
!52 = !DILocation(line: 34, column: 39, scope: !45)
!53 = !DILocation(line: 34, column: 32, scope: !45)
!54 = !DILocation(line: 34, column: 47, scope: !45)
!55 = !DILocation(line: 34, column: 52, scope: !45)
!56 = !DILocation(line: 35, column: 20, scope: !45)
!57 = !DILocation(line: 35, column: 9, scope: !45)
!58 = !DILocation(line: 37, column: 1, scope: !41)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_44_good", scope: !16, file: !16, line: 83, type: !17, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 85, column: 5, scope: !59)
!61 = !DILocation(line: 86, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 97, type: !63, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!7, !7, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !16, line: 97, type: !7)
!69 = !DILocation(line: 97, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !16, line: 97, type: !65)
!71 = !DILocation(line: 97, column: 27, scope: !62)
!72 = !DILocation(line: 100, column: 22, scope: !62)
!73 = !DILocation(line: 100, column: 12, scope: !62)
!74 = !DILocation(line: 100, column: 5, scope: !62)
!75 = !DILocation(line: 102, column: 5, scope: !62)
!76 = !DILocation(line: 103, column: 5, scope: !62)
!77 = !DILocation(line: 104, column: 5, scope: !62)
!78 = !DILocation(line: 107, column: 5, scope: !62)
!79 = !DILocation(line: 108, column: 5, scope: !62)
!80 = !DILocation(line: 109, column: 5, scope: !62)
!81 = !DILocation(line: 111, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 70, type: !17, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !16, line: 72, type: !4)
!84 = !DILocation(line: 72, column: 15, scope: !82)
!85 = !DILocalVariable(name: "funcPtr", scope: !82, file: !16, line: 73, type: !22)
!86 = !DILocation(line: 73, column: 12, scope: !82)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !16, line: 74, type: !4)
!88 = !DILocation(line: 74, column: 15, scope: !82)
!89 = !DILocation(line: 74, column: 42, scope: !82)
!90 = !DILocation(line: 74, column: 31, scope: !82)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !16, line: 75, type: !4)
!92 = !DILocation(line: 75, column: 15, scope: !82)
!93 = !DILocation(line: 75, column: 43, scope: !82)
!94 = !DILocation(line: 75, column: 32, scope: !82)
!95 = !DILocation(line: 78, column: 12, scope: !82)
!96 = !DILocation(line: 78, column: 10, scope: !82)
!97 = !DILocation(line: 79, column: 5, scope: !82)
!98 = !DILocation(line: 79, column: 13, scope: !82)
!99 = !DILocation(line: 80, column: 5, scope: !82)
!100 = !DILocation(line: 80, column: 13, scope: !82)
!101 = !DILocation(line: 81, column: 1, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 59, type: !23, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", arg: 1, scope: !102, file: !16, line: 59, type: !4)
!104 = !DILocation(line: 59, column: 35, scope: !102)
!105 = !DILocalVariable(name: "source", scope: !106, file: !16, line: 62, type: !46)
!106 = distinct !DILexicalBlock(scope: !102, file: !16, line: 61, column: 5)
!107 = !DILocation(line: 62, column: 17, scope: !106)
!108 = !DILocation(line: 65, column: 17, scope: !106)
!109 = !DILocation(line: 65, column: 9, scope: !106)
!110 = !DILocation(line: 65, column: 39, scope: !106)
!111 = !DILocation(line: 65, column: 32, scope: !106)
!112 = !DILocation(line: 65, column: 47, scope: !106)
!113 = !DILocation(line: 65, column: 52, scope: !106)
!114 = !DILocation(line: 66, column: 20, scope: !106)
!115 = !DILocation(line: 66, column: 9, scope: !106)
!116 = !DILocation(line: 68, column: 1, scope: !102)
