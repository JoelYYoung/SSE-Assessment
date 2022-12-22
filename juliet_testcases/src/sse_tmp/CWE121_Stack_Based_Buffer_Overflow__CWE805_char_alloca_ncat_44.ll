; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  store i8* %2, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  call void %4(i8* %5), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx, align 1, !dbg !48
  %0 = load i8*, i8** %data.addr, align 8, !dbg !49
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  %call = call i8* @strncat(i8* %0, i8* %arraydecay1, i64 100) #5, !dbg !51
  %1 = load i8*, i8** %data.addr, align 8, !dbg !52
  call void @printLine(i8* %1), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_44_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_44_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_44_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !80, metadata !DIExpression()), !dbg !81
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 50, align 16, !dbg !84
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %1 = alloca i8, i64 100, align 16, !dbg !87
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !86
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !88
  store i8* %2, i8** %data, align 8, !dbg !89
  %3 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !92
  %5 = load i8*, i8** %data, align 8, !dbg !93
  call void %4(i8* %5), !dbg !92
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !95 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %0 = load i8*, i8** %data.addr, align 8, !dbg !104
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  %call = call i8* @strncat(i8* %0, i8* %arraydecay1, i64 100) #5, !dbg !106
  %1 = load i8*, i8** %data.addr, align 8, !dbg !107
  call void @printLine(i8* %1), !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_44_bad", scope: !14, file: !14, line: 35, type: !15, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_44.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 37, type: !4)
!18 = !DILocation(line: 37, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 39, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 39, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 40, type: !4)
!25 = !DILocation(line: 40, column: 12, scope: !13)
!26 = !DILocation(line: 40, column: 36, scope: !13)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 41, type: !4)
!28 = !DILocation(line: 41, column: 12, scope: !13)
!29 = !DILocation(line: 41, column: 37, scope: !13)
!30 = !DILocation(line: 44, column: 12, scope: !13)
!31 = !DILocation(line: 44, column: 10, scope: !13)
!32 = !DILocation(line: 45, column: 5, scope: !13)
!33 = !DILocation(line: 45, column: 13, scope: !13)
!34 = !DILocation(line: 47, column: 5, scope: !13)
!35 = !DILocation(line: 47, column: 13, scope: !13)
!36 = !DILocation(line: 48, column: 1, scope: !13)
!37 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !14, line: 23, type: !4)
!39 = !DILocation(line: 23, column: 28, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !14, line: 26, type: !42)
!41 = distinct !DILexicalBlock(scope: !37, file: !14, line: 25, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 26, column: 14, scope: !41)
!46 = !DILocation(line: 27, column: 9, scope: !41)
!47 = !DILocation(line: 28, column: 9, scope: !41)
!48 = !DILocation(line: 28, column: 23, scope: !41)
!49 = !DILocation(line: 30, column: 17, scope: !41)
!50 = !DILocation(line: 30, column: 23, scope: !41)
!51 = !DILocation(line: 30, column: 9, scope: !41)
!52 = !DILocation(line: 31, column: 19, scope: !41)
!53 = !DILocation(line: 31, column: 9, scope: !41)
!54 = !DILocation(line: 33, column: 1, scope: !37)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_44_good", scope: !14, file: !14, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 81, column: 5, scope: !55)
!57 = !DILocation(line: 82, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 93, type: !59, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !14, line: 93, type: !61)
!64 = !DILocation(line: 93, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !14, line: 93, type: !62)
!66 = !DILocation(line: 93, column: 27, scope: !58)
!67 = !DILocation(line: 96, column: 22, scope: !58)
!68 = !DILocation(line: 96, column: 12, scope: !58)
!69 = !DILocation(line: 96, column: 5, scope: !58)
!70 = !DILocation(line: 98, column: 5, scope: !58)
!71 = !DILocation(line: 99, column: 5, scope: !58)
!72 = !DILocation(line: 100, column: 5, scope: !58)
!73 = !DILocation(line: 103, column: 5, scope: !58)
!74 = !DILocation(line: 104, column: 5, scope: !58)
!75 = !DILocation(line: 105, column: 5, scope: !58)
!76 = !DILocation(line: 107, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 67, type: !15, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !14, line: 69, type: !4)
!79 = !DILocation(line: 69, column: 12, scope: !77)
!80 = !DILocalVariable(name: "funcPtr", scope: !77, file: !14, line: 70, type: !20)
!81 = !DILocation(line: 70, column: 12, scope: !77)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !14, line: 71, type: !4)
!83 = !DILocation(line: 71, column: 12, scope: !77)
!84 = !DILocation(line: 71, column: 36, scope: !77)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !14, line: 72, type: !4)
!86 = !DILocation(line: 72, column: 12, scope: !77)
!87 = !DILocation(line: 72, column: 37, scope: !77)
!88 = !DILocation(line: 74, column: 12, scope: !77)
!89 = !DILocation(line: 74, column: 10, scope: !77)
!90 = !DILocation(line: 75, column: 5, scope: !77)
!91 = !DILocation(line: 75, column: 13, scope: !77)
!92 = !DILocation(line: 76, column: 5, scope: !77)
!93 = !DILocation(line: 76, column: 13, scope: !77)
!94 = !DILocation(line: 77, column: 1, scope: !77)
!95 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 55, type: !21, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", arg: 1, scope: !95, file: !14, line: 55, type: !4)
!97 = !DILocation(line: 55, column: 32, scope: !95)
!98 = !DILocalVariable(name: "source", scope: !99, file: !14, line: 58, type: !42)
!99 = distinct !DILexicalBlock(scope: !95, file: !14, line: 57, column: 5)
!100 = !DILocation(line: 58, column: 14, scope: !99)
!101 = !DILocation(line: 59, column: 9, scope: !99)
!102 = !DILocation(line: 60, column: 9, scope: !99)
!103 = !DILocation(line: 60, column: 23, scope: !99)
!104 = !DILocation(line: 62, column: 17, scope: !99)
!105 = !DILocation(line: 62, column: 23, scope: !99)
!106 = !DILocation(line: 62, column: 9, scope: !99)
!107 = !DILocation(line: 63, column: 19, scope: !99)
!108 = !DILocation(line: 63, column: 9, scope: !99)
!109 = !DILocation(line: 65, column: 1, scope: !95)
