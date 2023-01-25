; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_13_bad() #0 !dbg !11 {
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
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !35
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !36
  call void @printLine(i8* %arraydecay3), !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_13_good() #0 !dbg !40 {
entry:
  call void @good1(), !dbg !41
  call void @good2(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #6, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #6, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_13_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_13_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !64 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !65
  %cmp = icmp ne i32 %0, 5, !dbg !67
  br i1 %cmp, label %if.then, label %if.else, !dbg !68

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !69
  br label %if.end, !dbg !71

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !72, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !78
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !81
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !81
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !82
  store i8 0, i8* %arrayidx3, align 1, !dbg !83
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  call void @printLine(i8* %arraydecay4), !dbg !85
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !87 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !88
  %cmp = icmp eq i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !92, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !98
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !101
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !101
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx3, align 1, !dbg !103
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  call void @printLine(i8* %arraydecay4), !dbg !105
  br label %if.end, !dbg !106

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_13_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!35 = !DILocation(line: 31, column: 13, scope: !20)
!36 = !DILocation(line: 33, column: 23, scope: !20)
!37 = !DILocation(line: 33, column: 13, scope: !20)
!38 = !DILocation(line: 35, column: 5, scope: !21)
!39 = !DILocation(line: 36, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_13_good", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 83, column: 5, scope: !40)
!42 = !DILocation(line: 84, column: 5, scope: !40)
!43 = !DILocation(line: 85, column: 1, scope: !40)
!44 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !45, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !12, line: 96, type: !47)
!51 = !DILocation(line: 96, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !12, line: 96, type: !48)
!53 = !DILocation(line: 96, column: 27, scope: !44)
!54 = !DILocation(line: 99, column: 22, scope: !44)
!55 = !DILocation(line: 99, column: 12, scope: !44)
!56 = !DILocation(line: 99, column: 5, scope: !44)
!57 = !DILocation(line: 101, column: 5, scope: !44)
!58 = !DILocation(line: 102, column: 5, scope: !44)
!59 = !DILocation(line: 103, column: 5, scope: !44)
!60 = !DILocation(line: 106, column: 5, scope: !44)
!61 = !DILocation(line: 107, column: 5, scope: !44)
!62 = !DILocation(line: 108, column: 5, scope: !44)
!63 = !DILocation(line: 110, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 43, type: !13, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 45, column: 8, scope: !66)
!66 = distinct !DILexicalBlock(scope: !64, file: !12, line: 45, column: 8)
!67 = !DILocation(line: 45, column: 25, scope: !66)
!68 = !DILocation(line: 45, column: 8, scope: !64)
!69 = !DILocation(line: 48, column: 9, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !12, line: 46, column: 5)
!71 = !DILocation(line: 49, column: 5, scope: !70)
!72 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 53, type: !22)
!73 = distinct !DILexicalBlock(scope: !74, file: !12, line: 52, column: 9)
!74 = distinct !DILexicalBlock(scope: !66, file: !12, line: 51, column: 5)
!75 = !DILocation(line: 53, column: 18, scope: !73)
!76 = !DILocalVariable(name: "dest", scope: !73, file: !12, line: 53, type: !28)
!77 = !DILocation(line: 53, column: 29, scope: !73)
!78 = !DILocation(line: 55, column: 13, scope: !73)
!79 = !DILocation(line: 56, column: 13, scope: !73)
!80 = !DILocation(line: 56, column: 23, scope: !73)
!81 = !DILocation(line: 57, column: 13, scope: !73)
!82 = !DILocation(line: 58, column: 13, scope: !73)
!83 = !DILocation(line: 58, column: 22, scope: !73)
!84 = !DILocation(line: 59, column: 23, scope: !73)
!85 = !DILocation(line: 59, column: 13, scope: !73)
!86 = !DILocation(line: 62, column: 1, scope: !64)
!87 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 67, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !87, file: !12, line: 67, column: 8)
!90 = !DILocation(line: 67, column: 25, scope: !89)
!91 = !DILocation(line: 67, column: 8, scope: !87)
!92 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 70, type: !22)
!93 = distinct !DILexicalBlock(scope: !94, file: !12, line: 69, column: 9)
!94 = distinct !DILexicalBlock(scope: !89, file: !12, line: 68, column: 5)
!95 = !DILocation(line: 70, column: 18, scope: !93)
!96 = !DILocalVariable(name: "dest", scope: !93, file: !12, line: 70, type: !28)
!97 = !DILocation(line: 70, column: 29, scope: !93)
!98 = !DILocation(line: 72, column: 13, scope: !93)
!99 = !DILocation(line: 73, column: 13, scope: !93)
!100 = !DILocation(line: 73, column: 23, scope: !93)
!101 = !DILocation(line: 74, column: 13, scope: !93)
!102 = !DILocation(line: 75, column: 13, scope: !93)
!103 = !DILocation(line: 75, column: 22, scope: !93)
!104 = !DILocation(line: 76, column: 23, scope: !93)
!105 = !DILocation(line: 76, column: 13, scope: !93)
!106 = !DILocation(line: 78, column: 5, scope: !94)
!107 = !DILocation(line: 79, column: 1, scope: !87)
