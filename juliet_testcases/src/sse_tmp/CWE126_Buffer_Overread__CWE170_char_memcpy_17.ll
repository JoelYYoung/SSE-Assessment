; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_17_bad() #0 !dbg !11 {
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
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !41
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !42
  call void @printLine(i8* %arraydecay3), !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %j, align 4, !dbg !45
  %inc = add nsw i32 %1, 1, !dbg !45
  store i32 %inc, i32* %j, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_17_good() #0 !dbg !51 {
entry:
  call void @good1(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_17_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_17_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !73 {
entry:
  %k = alloca i32, align 4
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %k, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 0, i32* %k, align 4, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %k, align 4, !dbg !79
  %cmp = icmp slt i32 %0, 1, !dbg !81
  br i1 %cmp, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !83, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !89
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !92
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !92
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !92
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx3, align 1, !dbg !94
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !95
  call void @printLine(i8* %arraydecay4), !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %k, align 4, !dbg !98
  %inc = add nsw i32 %1, 1, !dbg !98
  store i32 %inc, i32* %k, align 4, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  ret void, !dbg !102
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_17_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_17.c", directory: "/root/SSE-Assessment")
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
!41 = !DILocation(line: 32, column: 13, scope: !26)
!42 = !DILocation(line: 34, column: 23, scope: !26)
!43 = !DILocation(line: 34, column: 13, scope: !26)
!44 = !DILocation(line: 36, column: 5, scope: !27)
!45 = !DILocation(line: 25, column: 24, scope: !22)
!46 = !DILocation(line: 25, column: 5, scope: !22)
!47 = distinct !{!47, !24, !48, !49}
!48 = !DILocation(line: 36, column: 5, scope: !19)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 37, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_17_good", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 63, column: 5, scope: !51)
!53 = !DILocation(line: 64, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 75, type: !55, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!16, !16, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 75, type: !16)
!60 = !DILocation(line: 75, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 75, type: !57)
!62 = !DILocation(line: 75, column: 27, scope: !54)
!63 = !DILocation(line: 78, column: 22, scope: !54)
!64 = !DILocation(line: 78, column: 12, scope: !54)
!65 = !DILocation(line: 78, column: 5, scope: !54)
!66 = !DILocation(line: 80, column: 5, scope: !54)
!67 = !DILocation(line: 81, column: 5, scope: !54)
!68 = !DILocation(line: 82, column: 5, scope: !54)
!69 = !DILocation(line: 85, column: 5, scope: !54)
!70 = !DILocation(line: 86, column: 5, scope: !54)
!71 = !DILocation(line: 87, column: 5, scope: !54)
!72 = !DILocation(line: 89, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 44, type: !13, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "k", scope: !73, file: !12, line: 46, type: !16)
!75 = !DILocation(line: 46, column: 9, scope: !73)
!76 = !DILocation(line: 47, column: 11, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !12, line: 47, column: 5)
!78 = !DILocation(line: 47, column: 9, scope: !77)
!79 = !DILocation(line: 47, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !12, line: 47, column: 5)
!81 = !DILocation(line: 47, column: 18, scope: !80)
!82 = !DILocation(line: 47, column: 5, scope: !77)
!83 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 50, type: !28)
!84 = distinct !DILexicalBlock(scope: !85, file: !12, line: 49, column: 9)
!85 = distinct !DILexicalBlock(scope: !80, file: !12, line: 48, column: 5)
!86 = !DILocation(line: 50, column: 18, scope: !84)
!87 = !DILocalVariable(name: "dest", scope: !84, file: !12, line: 50, type: !34)
!88 = !DILocation(line: 50, column: 29, scope: !84)
!89 = !DILocation(line: 52, column: 13, scope: !84)
!90 = !DILocation(line: 53, column: 13, scope: !84)
!91 = !DILocation(line: 53, column: 23, scope: !84)
!92 = !DILocation(line: 54, column: 13, scope: !84)
!93 = !DILocation(line: 55, column: 13, scope: !84)
!94 = !DILocation(line: 55, column: 22, scope: !84)
!95 = !DILocation(line: 56, column: 23, scope: !84)
!96 = !DILocation(line: 56, column: 13, scope: !84)
!97 = !DILocation(line: 58, column: 5, scope: !85)
!98 = !DILocation(line: 47, column: 24, scope: !80)
!99 = !DILocation(line: 47, column: 5, scope: !80)
!100 = distinct !{!100, !82, !101, !49}
!101 = !DILocation(line: 58, column: 5, scope: !77)
!102 = !DILocation(line: 59, column: 1, scope: !73)
