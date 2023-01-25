; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_16.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_16_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
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
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  br label %while.body, !dbg !37

while.body:                                       ; preds = %entry
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  store i32* %8, i32** %data, align 8, !dbg !40
  br label %while.end, !dbg !41

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !49
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx4, align 4, !dbg !51
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %9 = bitcast i32* %arraydecay5 to i8*, !dbg !52
  %10 = load i32*, i32** %data, align 8, !dbg !53
  %11 = bitcast i32* %10 to i8*, !dbg !52
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !55
  %mul = mul i64 %call7, 4, !dbg !56
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %9, i8* align 4 %11, i64 %mul, i1 false), !dbg !52
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx8, align 4, !dbg !58
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  call void @printWLine(i32* %arraydecay9), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_16_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #6, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #6, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_16_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_16_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = alloca i8, i64 200, align 16, !dbg !90
  %1 = bitcast i8* %0 to i32*, !dbg !91
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %2 = alloca i8, i64 400, align 16, !dbg !94
  %3 = bitcast i8* %2 to i32*, !dbg !95
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !93
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !96
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !97
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !100
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !101
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !102
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !102
  store i32 0, i32* %arrayidx2, align 4, !dbg !103
  br label %while.body, !dbg !104

while.body:                                       ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !105
  store i32* %8, i32** %data, align 8, !dbg !107
  br label %while.end, !dbg !108

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !113
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx4, align 4, !dbg !115
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !116
  %9 = bitcast i32* %arraydecay5 to i8*, !dbg !116
  %10 = load i32*, i32** %data, align 8, !dbg !117
  %11 = bitcast i32* %10 to i8*, !dbg !116
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !119
  %mul = mul i64 %call7, 4, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %9, i8* align 4 %11, i64 %mul, i1 false), !dbg !116
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx8, align 4, !dbg !122
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  call void @printWLine(i32* %arraydecay9), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_16_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!29 = !DILocation(line: 28, column: 13, scope: !15)
!30 = !DILocation(line: 28, column: 5, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 29, column: 25, scope: !15)
!33 = !DILocation(line: 30, column: 13, scope: !15)
!34 = !DILocation(line: 30, column: 5, scope: !15)
!35 = !DILocation(line: 31, column: 5, scope: !15)
!36 = !DILocation(line: 31, column: 27, scope: !15)
!37 = !DILocation(line: 32, column: 5, scope: !15)
!38 = !DILocation(line: 35, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 5)
!40 = !DILocation(line: 35, column: 14, scope: !39)
!41 = !DILocation(line: 36, column: 9, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !16, line: 39, type: !44)
!43 = distinct !DILexicalBlock(scope: !15, file: !16, line: 38, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 39, column: 17, scope: !43)
!48 = !DILocation(line: 40, column: 17, scope: !43)
!49 = !DILocation(line: 40, column: 9, scope: !43)
!50 = !DILocation(line: 41, column: 9, scope: !43)
!51 = !DILocation(line: 41, column: 21, scope: !43)
!52 = !DILocation(line: 44, column: 9, scope: !43)
!53 = !DILocation(line: 44, column: 22, scope: !43)
!54 = !DILocation(line: 44, column: 35, scope: !43)
!55 = !DILocation(line: 44, column: 28, scope: !43)
!56 = !DILocation(line: 44, column: 40, scope: !43)
!57 = !DILocation(line: 45, column: 9, scope: !43)
!58 = !DILocation(line: 45, column: 21, scope: !43)
!59 = !DILocation(line: 46, column: 20, scope: !43)
!60 = !DILocation(line: 46, column: 9, scope: !43)
!61 = !DILocation(line: 48, column: 1, scope: !15)
!62 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_16_good", scope: !16, file: !16, line: 82, type: !17, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 84, column: 5, scope: !62)
!64 = !DILocation(line: 85, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 97, type: !66, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!7, !7, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !16, line: 97, type: !7)
!72 = !DILocation(line: 97, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !16, line: 97, type: !68)
!74 = !DILocation(line: 97, column: 27, scope: !65)
!75 = !DILocation(line: 100, column: 22, scope: !65)
!76 = !DILocation(line: 100, column: 12, scope: !65)
!77 = !DILocation(line: 100, column: 5, scope: !65)
!78 = !DILocation(line: 102, column: 5, scope: !65)
!79 = !DILocation(line: 103, column: 5, scope: !65)
!80 = !DILocation(line: 104, column: 5, scope: !65)
!81 = !DILocation(line: 107, column: 5, scope: !65)
!82 = !DILocation(line: 108, column: 5, scope: !65)
!83 = !DILocation(line: 109, column: 5, scope: !65)
!84 = !DILocation(line: 111, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !16, line: 57, type: !4)
!87 = !DILocation(line: 57, column: 15, scope: !85)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !16, line: 58, type: !4)
!89 = !DILocation(line: 58, column: 15, scope: !85)
!90 = !DILocation(line: 58, column: 42, scope: !85)
!91 = !DILocation(line: 58, column: 31, scope: !85)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !16, line: 59, type: !4)
!93 = !DILocation(line: 59, column: 15, scope: !85)
!94 = !DILocation(line: 59, column: 43, scope: !85)
!95 = !DILocation(line: 59, column: 32, scope: !85)
!96 = !DILocation(line: 60, column: 13, scope: !85)
!97 = !DILocation(line: 60, column: 5, scope: !85)
!98 = !DILocation(line: 61, column: 5, scope: !85)
!99 = !DILocation(line: 61, column: 25, scope: !85)
!100 = !DILocation(line: 62, column: 13, scope: !85)
!101 = !DILocation(line: 62, column: 5, scope: !85)
!102 = !DILocation(line: 63, column: 5, scope: !85)
!103 = !DILocation(line: 63, column: 27, scope: !85)
!104 = !DILocation(line: 64, column: 5, scope: !85)
!105 = !DILocation(line: 67, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !85, file: !16, line: 65, column: 5)
!107 = !DILocation(line: 67, column: 14, scope: !106)
!108 = !DILocation(line: 68, column: 9, scope: !106)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !16, line: 71, type: !44)
!110 = distinct !DILexicalBlock(scope: !85, file: !16, line: 70, column: 5)
!111 = !DILocation(line: 71, column: 17, scope: !110)
!112 = !DILocation(line: 72, column: 17, scope: !110)
!113 = !DILocation(line: 72, column: 9, scope: !110)
!114 = !DILocation(line: 73, column: 9, scope: !110)
!115 = !DILocation(line: 73, column: 21, scope: !110)
!116 = !DILocation(line: 76, column: 9, scope: !110)
!117 = !DILocation(line: 76, column: 22, scope: !110)
!118 = !DILocation(line: 76, column: 35, scope: !110)
!119 = !DILocation(line: 76, column: 28, scope: !110)
!120 = !DILocation(line: 76, column: 40, scope: !110)
!121 = !DILocation(line: 77, column: 9, scope: !110)
!122 = !DILocation(line: 77, column: 21, scope: !110)
!123 = !DILocation(line: 78, column: 20, scope: !110)
!124 = !DILocation(line: 78, column: 9, scope: !110)
!125 = !DILocation(line: 80, column: 1, scope: !85)
