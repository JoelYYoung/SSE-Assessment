; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_12_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %data5 = alloca [150 x i8], align 16
  %dest6 = alloca [100 x i8], align 16
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.else, !dbg !17

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

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data5, metadata !40, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest6, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay7 = getelementptr inbounds [150 x i8], [150 x i8]* %data5, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay7, i8 65, i64 149, i1 false), !dbg !46
  %arrayidx8 = getelementptr inbounds [150 x i8], [150 x i8]* %data5, i64 0, i64 149, !dbg !47
  store i8 0, i8* %arrayidx8, align 1, !dbg !48
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest6, i64 0, i64 0, !dbg !49
  %arraydecay10 = getelementptr inbounds [150 x i8], [150 x i8]* %data5, i64 0, i64 0, !dbg !50
  %call11 = call i8* @strncpy(i8* %arraydecay9, i8* %arraydecay10, i64 99) #5, !dbg !51
  %arrayidx12 = getelementptr inbounds [100 x i8], [100 x i8]* %dest6, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx12, align 1, !dbg !53
  %arraydecay13 = getelementptr inbounds [100 x i8], [100 x i8]* %dest6, i64 0, i64 0, !dbg !54
  call void @printLine(i8* %arraydecay13), !dbg !55
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !56
}

declare dso_local i32 @globalReturnsTrueOrFalse(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #4

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_12_good() #0 !dbg !57 {
entry:
  call void @good1(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_12_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_12_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !80 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %data6 = alloca [150 x i8], align 16
  %dest7 = alloca [100 x i8], align 16
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !84, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !90
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !93
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !94
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !95
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx4, align 1, !dbg !97
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  call void @printLine(i8* %arraydecay5), !dbg !99
  br label %if.end, !dbg !100

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data6, metadata !101, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest7, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay8 = getelementptr inbounds [150 x i8], [150 x i8]* %data6, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay8, i8 65, i64 149, i1 false), !dbg !107
  %arrayidx9 = getelementptr inbounds [150 x i8], [150 x i8]* %data6, i64 0, i64 149, !dbg !108
  store i8 0, i8* %arrayidx9, align 1, !dbg !109
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest7, i64 0, i64 0, !dbg !110
  %arraydecay11 = getelementptr inbounds [150 x i8], [150 x i8]* %data6, i64 0, i64 0, !dbg !111
  %call12 = call i8* @strncpy(i8* %arraydecay10, i8* %arraydecay11, i64 99) #5, !dbg !112
  %arrayidx13 = getelementptr inbounds [100 x i8], [100 x i8]* %dest7, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx13, align 1, !dbg !114
  %arraydecay14 = getelementptr inbounds [100 x i8], [100 x i8]* %dest7, i64 0, i64 0, !dbg !115
  call void @printLine(i8* %arraydecay14), !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_12_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 8, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 27, type: !21)
!19 = distinct !DILexicalBlock(scope: !20, file: !12, line: 26, column: 9)
!20 = distinct !DILexicalBlock(scope: !16, file: !12, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 1200, elements: !23)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !{!24}
!24 = !DISubrange(count: 150)
!25 = !DILocation(line: 27, column: 18, scope: !19)
!26 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 29, scope: !19)
!31 = !DILocation(line: 29, column: 13, scope: !19)
!32 = !DILocation(line: 30, column: 13, scope: !19)
!33 = !DILocation(line: 30, column: 23, scope: !19)
!34 = !DILocation(line: 33, column: 21, scope: !19)
!35 = !DILocation(line: 33, column: 27, scope: !19)
!36 = !DILocation(line: 33, column: 13, scope: !19)
!37 = !DILocation(line: 35, column: 23, scope: !19)
!38 = !DILocation(line: 35, column: 13, scope: !19)
!39 = !DILocation(line: 37, column: 5, scope: !20)
!40 = !DILocalVariable(name: "data", scope: !41, file: !12, line: 41, type: !21)
!41 = distinct !DILexicalBlock(scope: !42, file: !12, line: 40, column: 9)
!42 = distinct !DILexicalBlock(scope: !16, file: !12, line: 39, column: 5)
!43 = !DILocation(line: 41, column: 18, scope: !41)
!44 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 41, type: !27)
!45 = !DILocation(line: 41, column: 29, scope: !41)
!46 = !DILocation(line: 43, column: 13, scope: !41)
!47 = !DILocation(line: 44, column: 13, scope: !41)
!48 = !DILocation(line: 44, column: 23, scope: !41)
!49 = !DILocation(line: 47, column: 21, scope: !41)
!50 = !DILocation(line: 47, column: 27, scope: !41)
!51 = !DILocation(line: 47, column: 13, scope: !41)
!52 = !DILocation(line: 48, column: 13, scope: !41)
!53 = !DILocation(line: 48, column: 22, scope: !41)
!54 = !DILocation(line: 49, column: 23, scope: !41)
!55 = !DILocation(line: 49, column: 13, scope: !41)
!56 = !DILocation(line: 52, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_12_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 93, column: 5, scope: !57)
!59 = !DILocation(line: 94, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 105, type: !61, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 105, type: !63)
!67 = !DILocation(line: 105, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 105, type: !64)
!69 = !DILocation(line: 105, column: 27, scope: !60)
!70 = !DILocation(line: 108, column: 22, scope: !60)
!71 = !DILocation(line: 108, column: 12, scope: !60)
!72 = !DILocation(line: 108, column: 5, scope: !60)
!73 = !DILocation(line: 110, column: 5, scope: !60)
!74 = !DILocation(line: 111, column: 5, scope: !60)
!75 = !DILocation(line: 112, column: 5, scope: !60)
!76 = !DILocation(line: 115, column: 5, scope: !60)
!77 = !DILocation(line: 116, column: 5, scope: !60)
!78 = !DILocation(line: 117, column: 5, scope: !60)
!79 = !DILocation(line: 119, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 61, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !80, file: !12, line: 61, column: 8)
!83 = !DILocation(line: 61, column: 8, scope: !80)
!84 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 64, type: !21)
!85 = distinct !DILexicalBlock(scope: !86, file: !12, line: 63, column: 9)
!86 = distinct !DILexicalBlock(scope: !82, file: !12, line: 62, column: 5)
!87 = !DILocation(line: 64, column: 18, scope: !85)
!88 = !DILocalVariable(name: "dest", scope: !85, file: !12, line: 64, type: !27)
!89 = !DILocation(line: 64, column: 29, scope: !85)
!90 = !DILocation(line: 66, column: 13, scope: !85)
!91 = !DILocation(line: 67, column: 13, scope: !85)
!92 = !DILocation(line: 67, column: 23, scope: !85)
!93 = !DILocation(line: 70, column: 21, scope: !85)
!94 = !DILocation(line: 70, column: 27, scope: !85)
!95 = !DILocation(line: 70, column: 13, scope: !85)
!96 = !DILocation(line: 71, column: 13, scope: !85)
!97 = !DILocation(line: 71, column: 22, scope: !85)
!98 = !DILocation(line: 72, column: 23, scope: !85)
!99 = !DILocation(line: 72, column: 13, scope: !85)
!100 = !DILocation(line: 74, column: 5, scope: !86)
!101 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 78, type: !21)
!102 = distinct !DILexicalBlock(scope: !103, file: !12, line: 77, column: 9)
!103 = distinct !DILexicalBlock(scope: !82, file: !12, line: 76, column: 5)
!104 = !DILocation(line: 78, column: 18, scope: !102)
!105 = !DILocalVariable(name: "dest", scope: !102, file: !12, line: 78, type: !27)
!106 = !DILocation(line: 78, column: 29, scope: !102)
!107 = !DILocation(line: 80, column: 13, scope: !102)
!108 = !DILocation(line: 81, column: 13, scope: !102)
!109 = !DILocation(line: 81, column: 23, scope: !102)
!110 = !DILocation(line: 84, column: 21, scope: !102)
!111 = !DILocation(line: 84, column: 27, scope: !102)
!112 = !DILocation(line: 84, column: 13, scope: !102)
!113 = !DILocation(line: 85, column: 13, scope: !102)
!114 = !DILocation(line: 85, column: 22, scope: !102)
!115 = !DILocation(line: 86, column: 23, scope: !102)
!116 = !DILocation(line: 86, column: 13, scope: !102)
!117 = !DILocation(line: 89, column: 1, scope: !80)
