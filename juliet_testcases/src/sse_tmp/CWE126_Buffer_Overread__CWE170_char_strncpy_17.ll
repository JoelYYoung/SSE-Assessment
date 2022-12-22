; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_17_bad() #0 !dbg !11 {
entry:
  %j = alloca i32, align 4
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %j, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %j, align 4, !dbg !18
  br label %for.cond, !dbg !20

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %j, align 4, !dbg !21
  %cmp = icmp slt i32 %0, 1, !dbg !23
  br i1 %cmp, label %for.body, label %for.end, !dbg !24

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !25, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !38
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !42
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !43
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  call void @printLine(i8* %arraydecay3), !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %j, align 4, !dbg !47
  %inc = add nsw i32 %1, 1, !dbg !47
  store i32 %inc, i32* %j, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_17_good() #0 !dbg !53 {
entry:
  call void @good1(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_17_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_17_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !75 {
entry:
  %k = alloca i32, align 4
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %k, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 0, i32* %k, align 4, !dbg !78
  br label %for.cond, !dbg !80

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %k, align 4, !dbg !81
  %cmp = icmp slt i32 %0, 1, !dbg !83
  br i1 %cmp, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !85, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !89, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !91
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !94
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !95
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !96
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx3, align 1, !dbg !98
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  call void @printLine(i8* %arraydecay4), !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %k, align 4, !dbg !102
  %inc = add nsw i32 %1, 1, !dbg !102
  store i32 %inc, i32* %k, align 4, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  ret void, !dbg !106
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_17_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_17.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "j", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 25, column: 11, scope: !19)
!19 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!20 = !DILocation(line: 25, column: 9, scope: !19)
!21 = !DILocation(line: 25, column: 16, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !12, line: 25, column: 5)
!23 = !DILocation(line: 25, column: 18, scope: !22)
!24 = !DILocation(line: 25, column: 5, scope: !19)
!25 = !DILocalVariable(name: "data", scope: !26, file: !12, line: 28, type: !28)
!26 = distinct !DILexicalBlock(scope: !27, file: !12, line: 27, column: 9)
!27 = distinct !DILexicalBlock(scope: !22, file: !12, line: 26, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 1200, elements: !30)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!31}
!31 = !DISubrange(count: 150)
!32 = !DILocation(line: 28, column: 18, scope: !26)
!33 = !DILocalVariable(name: "dest", scope: !26, file: !12, line: 28, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 800, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 28, column: 29, scope: !26)
!38 = !DILocation(line: 30, column: 13, scope: !26)
!39 = !DILocation(line: 31, column: 13, scope: !26)
!40 = !DILocation(line: 31, column: 23, scope: !26)
!41 = !DILocation(line: 34, column: 21, scope: !26)
!42 = !DILocation(line: 34, column: 27, scope: !26)
!43 = !DILocation(line: 34, column: 13, scope: !26)
!44 = !DILocation(line: 36, column: 23, scope: !26)
!45 = !DILocation(line: 36, column: 13, scope: !26)
!46 = !DILocation(line: 38, column: 5, scope: !27)
!47 = !DILocation(line: 25, column: 24, scope: !22)
!48 = !DILocation(line: 25, column: 5, scope: !22)
!49 = distinct !{!49, !24, !50, !51}
!50 = !DILocation(line: 38, column: 5, scope: !19)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 39, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_17_good", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 67, column: 5, scope: !53)
!55 = !DILocation(line: 68, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 79, type: !57, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!16, !16, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 79, type: !16)
!62 = !DILocation(line: 79, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 79, type: !59)
!64 = !DILocation(line: 79, column: 27, scope: !56)
!65 = !DILocation(line: 82, column: 22, scope: !56)
!66 = !DILocation(line: 82, column: 12, scope: !56)
!67 = !DILocation(line: 82, column: 5, scope: !56)
!68 = !DILocation(line: 84, column: 5, scope: !56)
!69 = !DILocation(line: 85, column: 5, scope: !56)
!70 = !DILocation(line: 86, column: 5, scope: !56)
!71 = !DILocation(line: 89, column: 5, scope: !56)
!72 = !DILocation(line: 90, column: 5, scope: !56)
!73 = !DILocation(line: 91, column: 5, scope: !56)
!74 = !DILocation(line: 93, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "k", scope: !75, file: !12, line: 48, type: !16)
!77 = !DILocation(line: 48, column: 9, scope: !75)
!78 = !DILocation(line: 49, column: 11, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !12, line: 49, column: 5)
!80 = !DILocation(line: 49, column: 9, scope: !79)
!81 = !DILocation(line: 49, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !12, line: 49, column: 5)
!83 = !DILocation(line: 49, column: 18, scope: !82)
!84 = !DILocation(line: 49, column: 5, scope: !79)
!85 = !DILocalVariable(name: "data", scope: !86, file: !12, line: 52, type: !28)
!86 = distinct !DILexicalBlock(scope: !87, file: !12, line: 51, column: 9)
!87 = distinct !DILexicalBlock(scope: !82, file: !12, line: 50, column: 5)
!88 = !DILocation(line: 52, column: 18, scope: !86)
!89 = !DILocalVariable(name: "dest", scope: !86, file: !12, line: 52, type: !34)
!90 = !DILocation(line: 52, column: 29, scope: !86)
!91 = !DILocation(line: 54, column: 13, scope: !86)
!92 = !DILocation(line: 55, column: 13, scope: !86)
!93 = !DILocation(line: 55, column: 23, scope: !86)
!94 = !DILocation(line: 58, column: 21, scope: !86)
!95 = !DILocation(line: 58, column: 27, scope: !86)
!96 = !DILocation(line: 58, column: 13, scope: !86)
!97 = !DILocation(line: 59, column: 13, scope: !86)
!98 = !DILocation(line: 59, column: 22, scope: !86)
!99 = !DILocation(line: 60, column: 23, scope: !86)
!100 = !DILocation(line: 60, column: 13, scope: !86)
!101 = !DILocation(line: 62, column: 5, scope: !87)
!102 = !DILocation(line: 49, column: 24, scope: !82)
!103 = !DILocation(line: 49, column: 5, scope: !82)
!104 = distinct !{!104, !84, !105, !51}
!105 = !DILocation(line: 62, column: 5, scope: !79)
!106 = !DILocation(line: 63, column: 1, scope: !75)
