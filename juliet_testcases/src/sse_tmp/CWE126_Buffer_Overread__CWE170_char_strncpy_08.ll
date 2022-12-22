; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %call = call i32 @staticReturnsTrue(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.end, !dbg !17

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !18, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !31
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !34
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !35
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !36
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !37
  call void @printLine(i8* %arraydecay4), !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_08_good() #0 !dbg !41 {
entry:
  call void @good1(), !dbg !42
  call void @good2(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #5, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #5, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_08_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_08_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !65 {
entry:
  ret i32 1, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !69 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %call = call i32 @staticReturnsFalse(), !dbg !70
  %tobool = icmp ne i32 %call, 0, !dbg !70
  br i1 %tobool, label %if.then, label %if.else, !dbg !72

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
  br label %if.end, !dbg !75

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !76, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !82
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !85
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !86
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !87
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !88
  store i8 0, i8* %arrayidx4, align 1, !dbg !89
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !90
  call void @printLine(i8* %arraydecay5), !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !93 {
entry:
  ret i32 0, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !95 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %call = call i32 @staticReturnsTrue(), !dbg !96
  %tobool = icmp ne i32 %call, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !99, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !105
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !109
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !110
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx4, align 1, !dbg !112
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  call void @printLine(i8* %arraydecay5), !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !116
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 37, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 8)
!17 = !DILocation(line: 37, column: 8, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 40, type: !21)
!19 = distinct !DILexicalBlock(scope: !20, file: !12, line: 39, column: 9)
!20 = distinct !DILexicalBlock(scope: !16, file: !12, line: 38, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 1200, elements: !23)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !{!24}
!24 = !DISubrange(count: 150)
!25 = !DILocation(line: 40, column: 18, scope: !19)
!26 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 40, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 40, column: 29, scope: !19)
!31 = !DILocation(line: 42, column: 13, scope: !19)
!32 = !DILocation(line: 43, column: 13, scope: !19)
!33 = !DILocation(line: 43, column: 23, scope: !19)
!34 = !DILocation(line: 46, column: 21, scope: !19)
!35 = !DILocation(line: 46, column: 27, scope: !19)
!36 = !DILocation(line: 46, column: 13, scope: !19)
!37 = !DILocation(line: 48, column: 23, scope: !19)
!38 = !DILocation(line: 48, column: 13, scope: !19)
!39 = !DILocation(line: 50, column: 5, scope: !20)
!40 = !DILocation(line: 51, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_08_good", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 102, column: 5, scope: !41)
!43 = !DILocation(line: 103, column: 5, scope: !41)
!44 = !DILocation(line: 104, column: 1, scope: !41)
!45 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 115, type: !46, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !12, line: 115, type: !48)
!52 = !DILocation(line: 115, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !12, line: 115, type: !49)
!54 = !DILocation(line: 115, column: 27, scope: !45)
!55 = !DILocation(line: 118, column: 22, scope: !45)
!56 = !DILocation(line: 118, column: 12, scope: !45)
!57 = !DILocation(line: 118, column: 5, scope: !45)
!58 = !DILocation(line: 120, column: 5, scope: !45)
!59 = !DILocation(line: 121, column: 5, scope: !45)
!60 = !DILocation(line: 122, column: 5, scope: !45)
!61 = !DILocation(line: 125, column: 5, scope: !45)
!62 = !DILocation(line: 126, column: 5, scope: !45)
!63 = !DILocation(line: 127, column: 5, scope: !45)
!64 = !DILocation(line: 129, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !66, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!48}
!68 = !DILocation(line: 25, column: 5, scope: !65)
!69 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 60, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !69, file: !12, line: 60, column: 8)
!72 = !DILocation(line: 60, column: 8, scope: !69)
!73 = !DILocation(line: 63, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !12, line: 61, column: 5)
!75 = !DILocation(line: 64, column: 5, scope: !74)
!76 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 68, type: !21)
!77 = distinct !DILexicalBlock(scope: !78, file: !12, line: 67, column: 9)
!78 = distinct !DILexicalBlock(scope: !71, file: !12, line: 66, column: 5)
!79 = !DILocation(line: 68, column: 18, scope: !77)
!80 = !DILocalVariable(name: "dest", scope: !77, file: !12, line: 68, type: !27)
!81 = !DILocation(line: 68, column: 29, scope: !77)
!82 = !DILocation(line: 70, column: 13, scope: !77)
!83 = !DILocation(line: 71, column: 13, scope: !77)
!84 = !DILocation(line: 71, column: 23, scope: !77)
!85 = !DILocation(line: 74, column: 21, scope: !77)
!86 = !DILocation(line: 74, column: 27, scope: !77)
!87 = !DILocation(line: 74, column: 13, scope: !77)
!88 = !DILocation(line: 75, column: 13, scope: !77)
!89 = !DILocation(line: 75, column: 22, scope: !77)
!90 = !DILocation(line: 76, column: 23, scope: !77)
!91 = !DILocation(line: 76, column: 13, scope: !77)
!92 = !DILocation(line: 79, column: 1, scope: !69)
!93 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !66, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 30, column: 5, scope: !93)
!95 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 82, type: !13, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 84, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !95, file: !12, line: 84, column: 8)
!98 = !DILocation(line: 84, column: 8, scope: !95)
!99 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 87, type: !21)
!100 = distinct !DILexicalBlock(scope: !101, file: !12, line: 86, column: 9)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 85, column: 5)
!102 = !DILocation(line: 87, column: 18, scope: !100)
!103 = !DILocalVariable(name: "dest", scope: !100, file: !12, line: 87, type: !27)
!104 = !DILocation(line: 87, column: 29, scope: !100)
!105 = !DILocation(line: 89, column: 13, scope: !100)
!106 = !DILocation(line: 90, column: 13, scope: !100)
!107 = !DILocation(line: 90, column: 23, scope: !100)
!108 = !DILocation(line: 93, column: 21, scope: !100)
!109 = !DILocation(line: 93, column: 27, scope: !100)
!110 = !DILocation(line: 93, column: 13, scope: !100)
!111 = !DILocation(line: 94, column: 13, scope: !100)
!112 = !DILocation(line: 94, column: 22, scope: !100)
!113 = !DILocation(line: 95, column: 23, scope: !100)
!114 = !DILocation(line: 95, column: 13, scope: !100)
!115 = !DILocation(line: 97, column: 5, scope: !101)
!116 = !DILocation(line: 98, column: 1, scope: !95)
