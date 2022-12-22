; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_14_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i32, i32* @globalFive, align 4, !dbg !24
  %cmp = icmp eq i32 %2, 5, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !40
  %6 = load i8*, i8** %data, align 8, !dbg !41
  %call = call i8* @strcat(i8* %arraydecay, i8* %6) #5, !dbg !42
  %7 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %7), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_14_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_14_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_14_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 100, align 16, !dbg !74
  store i8* %0, i8** %dataBuffer, align 8, !dbg !73
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  store i8* %1, i8** %data, align 8, !dbg !76
  %2 = load i32, i32* @globalFive, align 4, !dbg !77
  %cmp = icmp ne i32 %2, 5, !dbg !79
  br i1 %cmp, label %if.then, label %if.else, !dbg !80

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  br label %if.end, !dbg !83

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !91
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !92
  %6 = load i8*, i8** %data, align 8, !dbg !93
  %call = call i8* @strcat(i8* %arraydecay, i8* %6) #5, !dbg !94
  %7 = load i8*, i8** %data, align 8, !dbg !95
  call void @printLine(i8* %7), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 100, align 16, !dbg !103
  store i8* %0, i8** %dataBuffer, align 8, !dbg !102
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  store i8* %1, i8** %data, align 8, !dbg !105
  %2 = load i32, i32* @globalFive, align 4, !dbg !106
  %cmp = icmp eq i32 %2, 5, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !112
  %4 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !118
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !119
  %6 = load i8*, i8** %data, align 8, !dbg !120
  %call = call i8* @strcat(i8* %arraydecay, i8* %6) #5, !dbg !121
  %7 = load i8*, i8** %data, align 8, !dbg !122
  call void @printLine(i8* %7), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_14.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_14_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_14.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 28, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!26 = !DILocation(line: 28, column: 18, scope: !25)
!27 = !DILocation(line: 28, column: 8, scope: !13)
!28 = !DILocation(line: 31, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 31, column: 9, scope: !29)
!31 = !DILocation(line: 32, column: 9, scope: !29)
!32 = !DILocation(line: 32, column: 21, scope: !29)
!33 = !DILocation(line: 33, column: 5, scope: !29)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !14, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 35, column: 14, scope: !35)
!40 = !DILocation(line: 37, column: 16, scope: !35)
!41 = !DILocation(line: 37, column: 22, scope: !35)
!42 = !DILocation(line: 37, column: 9, scope: !35)
!43 = !DILocation(line: 38, column: 19, scope: !35)
!44 = !DILocation(line: 38, column: 9, scope: !35)
!45 = !DILocation(line: 40, column: 1, scope: !13)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_14_good", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 93, column: 5, scope: !46)
!48 = !DILocation(line: 94, column: 5, scope: !46)
!49 = !DILocation(line: 95, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 107, type: !51, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !14, line: 107, type: !53)
!56 = !DILocation(line: 107, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !14, line: 107, type: !54)
!58 = !DILocation(line: 107, column: 27, scope: !50)
!59 = !DILocation(line: 110, column: 22, scope: !50)
!60 = !DILocation(line: 110, column: 12, scope: !50)
!61 = !DILocation(line: 110, column: 5, scope: !50)
!62 = !DILocation(line: 112, column: 5, scope: !50)
!63 = !DILocation(line: 113, column: 5, scope: !50)
!64 = !DILocation(line: 114, column: 5, scope: !50)
!65 = !DILocation(line: 117, column: 5, scope: !50)
!66 = !DILocation(line: 118, column: 5, scope: !50)
!67 = !DILocation(line: 119, column: 5, scope: !50)
!68 = !DILocation(line: 121, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 49, type: !4)
!71 = !DILocation(line: 49, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !14, line: 50, type: !4)
!73 = !DILocation(line: 50, column: 12, scope: !69)
!74 = !DILocation(line: 50, column: 33, scope: !69)
!75 = !DILocation(line: 51, column: 12, scope: !69)
!76 = !DILocation(line: 51, column: 10, scope: !69)
!77 = !DILocation(line: 52, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !69, file: !14, line: 52, column: 8)
!79 = !DILocation(line: 52, column: 18, scope: !78)
!80 = !DILocation(line: 52, column: 8, scope: !69)
!81 = !DILocation(line: 55, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !14, line: 53, column: 5)
!83 = !DILocation(line: 56, column: 5, scope: !82)
!84 = !DILocation(line: 60, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !14, line: 58, column: 5)
!86 = !DILocation(line: 60, column: 9, scope: !85)
!87 = !DILocation(line: 61, column: 9, scope: !85)
!88 = !DILocation(line: 61, column: 20, scope: !85)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !14, line: 64, type: !36)
!90 = distinct !DILexicalBlock(scope: !69, file: !14, line: 63, column: 5)
!91 = !DILocation(line: 64, column: 14, scope: !90)
!92 = !DILocation(line: 66, column: 16, scope: !90)
!93 = !DILocation(line: 66, column: 22, scope: !90)
!94 = !DILocation(line: 66, column: 9, scope: !90)
!95 = !DILocation(line: 67, column: 19, scope: !90)
!96 = !DILocation(line: 67, column: 9, scope: !90)
!97 = !DILocation(line: 69, column: 1, scope: !69)
!98 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 72, type: !15, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !14, line: 74, type: !4)
!100 = !DILocation(line: 74, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !14, line: 75, type: !4)
!102 = !DILocation(line: 75, column: 12, scope: !98)
!103 = !DILocation(line: 75, column: 33, scope: !98)
!104 = !DILocation(line: 76, column: 12, scope: !98)
!105 = !DILocation(line: 76, column: 10, scope: !98)
!106 = !DILocation(line: 77, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !98, file: !14, line: 77, column: 8)
!108 = !DILocation(line: 77, column: 18, scope: !107)
!109 = !DILocation(line: 77, column: 8, scope: !98)
!110 = !DILocation(line: 80, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !14, line: 78, column: 5)
!112 = !DILocation(line: 80, column: 9, scope: !111)
!113 = !DILocation(line: 81, column: 9, scope: !111)
!114 = !DILocation(line: 81, column: 20, scope: !111)
!115 = !DILocation(line: 82, column: 5, scope: !111)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !14, line: 84, type: !36)
!117 = distinct !DILexicalBlock(scope: !98, file: !14, line: 83, column: 5)
!118 = !DILocation(line: 84, column: 14, scope: !117)
!119 = !DILocation(line: 86, column: 16, scope: !117)
!120 = !DILocation(line: 86, column: 22, scope: !117)
!121 = !DILocation(line: 86, column: 9, scope: !117)
!122 = !DILocation(line: 87, column: 19, scope: !117)
!123 = !DILocation(line: 87, column: 9, scope: !117)
!124 = !DILocation(line: 89, column: 1, scope: !98)
