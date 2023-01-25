; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_13_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !15
  %cmp = icmp eq i32 %0, 5, !dbg !17
  br i1 %cmp, label %if.then, label %if.end, !dbg !18

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !19, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !32
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !35
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !36
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !37
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !38
  call void @printLine(i8* %arraydecay3), !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_13_good() #0 !dbg !42 {
entry:
  call void @good1(), !dbg !43
  call void @good2(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_13_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_13_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !66 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !67
  %cmp = icmp ne i32 %0, 5, !dbg !69
  br i1 %cmp, label %if.then, label %if.else, !dbg !70

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !71
  br label %if.end, !dbg !73

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !74, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !80
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !83
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !84
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !85
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !86
  store i8 0, i8* %arrayidx3, align 1, !dbg !87
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !88
  call void @printLine(i8* %arraydecay4), !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !91 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !92
  %cmp = icmp eq i32 %0, 5, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !96, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !102
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !105
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !106
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !107
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx3, align 1, !dbg !109
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !110
  call void @printLine(i8* %arraydecay4), !dbg !111
  br label %if.end, !dbg !112

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_13_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 25, scope: !16)
!18 = !DILocation(line: 24, column: 8, scope: !11)
!19 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 27, type: !22)
!20 = distinct !DILexicalBlock(scope: !21, file: !12, line: 26, column: 9)
!21 = distinct !DILexicalBlock(scope: !16, file: !12, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1200, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 150)
!26 = !DILocation(line: 27, column: 18, scope: !20)
!27 = !DILocalVariable(name: "dest", scope: !20, file: !12, line: 27, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 27, column: 29, scope: !20)
!32 = !DILocation(line: 29, column: 13, scope: !20)
!33 = !DILocation(line: 30, column: 13, scope: !20)
!34 = !DILocation(line: 30, column: 23, scope: !20)
!35 = !DILocation(line: 33, column: 21, scope: !20)
!36 = !DILocation(line: 33, column: 27, scope: !20)
!37 = !DILocation(line: 33, column: 13, scope: !20)
!38 = !DILocation(line: 35, column: 23, scope: !20)
!39 = !DILocation(line: 35, column: 13, scope: !20)
!40 = !DILocation(line: 37, column: 5, scope: !21)
!41 = !DILocation(line: 38, column: 1, scope: !11)
!42 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_13_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 89, column: 5, scope: !42)
!44 = !DILocation(line: 90, column: 5, scope: !42)
!45 = !DILocation(line: 91, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !47, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !12, line: 102, type: !49)
!53 = !DILocation(line: 102, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !12, line: 102, type: !50)
!55 = !DILocation(line: 102, column: 27, scope: !46)
!56 = !DILocation(line: 105, column: 22, scope: !46)
!57 = !DILocation(line: 105, column: 12, scope: !46)
!58 = !DILocation(line: 105, column: 5, scope: !46)
!59 = !DILocation(line: 107, column: 5, scope: !46)
!60 = !DILocation(line: 108, column: 5, scope: !46)
!61 = !DILocation(line: 109, column: 5, scope: !46)
!62 = !DILocation(line: 112, column: 5, scope: !46)
!63 = !DILocation(line: 113, column: 5, scope: !46)
!64 = !DILocation(line: 114, column: 5, scope: !46)
!65 = !DILocation(line: 116, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 47, column: 8, scope: !68)
!68 = distinct !DILexicalBlock(scope: !66, file: !12, line: 47, column: 8)
!69 = !DILocation(line: 47, column: 25, scope: !68)
!70 = !DILocation(line: 47, column: 8, scope: !66)
!71 = !DILocation(line: 50, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !12, line: 48, column: 5)
!73 = !DILocation(line: 51, column: 5, scope: !72)
!74 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 55, type: !22)
!75 = distinct !DILexicalBlock(scope: !76, file: !12, line: 54, column: 9)
!76 = distinct !DILexicalBlock(scope: !68, file: !12, line: 53, column: 5)
!77 = !DILocation(line: 55, column: 18, scope: !75)
!78 = !DILocalVariable(name: "dest", scope: !75, file: !12, line: 55, type: !28)
!79 = !DILocation(line: 55, column: 29, scope: !75)
!80 = !DILocation(line: 57, column: 13, scope: !75)
!81 = !DILocation(line: 58, column: 13, scope: !75)
!82 = !DILocation(line: 58, column: 23, scope: !75)
!83 = !DILocation(line: 61, column: 21, scope: !75)
!84 = !DILocation(line: 61, column: 27, scope: !75)
!85 = !DILocation(line: 61, column: 13, scope: !75)
!86 = !DILocation(line: 62, column: 13, scope: !75)
!87 = !DILocation(line: 62, column: 22, scope: !75)
!88 = !DILocation(line: 63, column: 23, scope: !75)
!89 = !DILocation(line: 63, column: 13, scope: !75)
!90 = !DILocation(line: 66, column: 1, scope: !66)
!91 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 71, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !91, file: !12, line: 71, column: 8)
!94 = !DILocation(line: 71, column: 25, scope: !93)
!95 = !DILocation(line: 71, column: 8, scope: !91)
!96 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 74, type: !22)
!97 = distinct !DILexicalBlock(scope: !98, file: !12, line: 73, column: 9)
!98 = distinct !DILexicalBlock(scope: !93, file: !12, line: 72, column: 5)
!99 = !DILocation(line: 74, column: 18, scope: !97)
!100 = !DILocalVariable(name: "dest", scope: !97, file: !12, line: 74, type: !28)
!101 = !DILocation(line: 74, column: 29, scope: !97)
!102 = !DILocation(line: 76, column: 13, scope: !97)
!103 = !DILocation(line: 77, column: 13, scope: !97)
!104 = !DILocation(line: 77, column: 23, scope: !97)
!105 = !DILocation(line: 80, column: 21, scope: !97)
!106 = !DILocation(line: 80, column: 27, scope: !97)
!107 = !DILocation(line: 80, column: 13, scope: !97)
!108 = !DILocation(line: 81, column: 13, scope: !97)
!109 = !DILocation(line: 81, column: 22, scope: !97)
!110 = !DILocation(line: 82, column: 23, scope: !97)
!111 = !DILocation(line: 82, column: 13, scope: !97)
!112 = !DILocation(line: 84, column: 5, scope: !98)
!113 = !DILocation(line: 85, column: 1, scope: !91)
