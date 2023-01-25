; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_11.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_11_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %call = call i32 (...) @globalReturnsTrue(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.end, !dbg !17

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !18, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i32, i32* %i, align 4, !dbg !40
  %cmp = icmp slt i32 %0, 99, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !44
  %idxprom = sext i32 %1 to i64, !dbg !46
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !46
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !46
  %3 = load i32, i32* %i, align 4, !dbg !47
  %idxprom2 = sext i32 %3 to i64, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !48
  store i8 %2, i8* %arrayidx3, align 1, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %4, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay4), !dbg !57
  br label %if.end, !dbg !58

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !59
}

declare dso_local i32 @globalReturnsTrue(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_11_good() #0 !dbg !60 {
entry:
  call void @good1(), !dbg !61
  call void @good2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__CWE170_char_loop_11_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__CWE170_char_loop_11_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !83 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %call = call i32 (...) @globalReturnsFalse(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !90, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32* %i, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !98
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  store i32 0, i32* %i, align 4, !dbg !101
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %if.else
  %0 = load i32, i32* %i, align 4, !dbg !104
  %cmp = icmp slt i32 %0, 99, !dbg !106
  br i1 %cmp, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !108
  %idxprom = sext i32 %1 to i64, !dbg !110
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !110
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !110
  %3 = load i32, i32* %i, align 4, !dbg !111
  %idxprom2 = sext i32 %3 to i64, !dbg !112
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !112
  store i8 %2, i8* %arrayidx3, align 1, !dbg !113
  br label %for.inc, !dbg !114

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !115
  %inc = add nsw i32 %4, 1, !dbg !115
  store i32 %inc, i32* %i, align 4, !dbg !115
  br label %for.cond, !dbg !116, !llvm.loop !117

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !119
  store i8 0, i8* %arrayidx4, align 1, !dbg !120
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !121
  call void @printLine(i8* %arraydecay5), !dbg !122
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  ret void, !dbg !123
}

declare dso_local i32 @globalReturnsFalse(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !124 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  %call = call i32 (...) @globalReturnsTrue(), !dbg !125
  %tobool = icmp ne i32 %call, 0, !dbg !125
  br i1 %tobool, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !128, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i32* %i, metadata !134, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !136
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !137
  store i8 0, i8* %arrayidx, align 1, !dbg !138
  store i32 0, i32* %i, align 4, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i32, i32* %i, align 4, !dbg !142
  %cmp = icmp slt i32 %0, 99, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !146
  %idxprom = sext i32 %1 to i64, !dbg !148
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !148
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !148
  %3 = load i32, i32* %i, align 4, !dbg !149
  %idxprom2 = sext i32 %3 to i64, !dbg !150
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !150
  store i8 %2, i8* %arrayidx3, align 1, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !153
  %inc = add nsw i32 %4, 1, !dbg !153
  store i32 %inc, i32* %i, align 4, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !157
  store i8 0, i8* %arrayidx4, align 1, !dbg !158
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !159
  call void @printLine(i8* %arraydecay5), !dbg !160
  br label %if.end, !dbg !161

if.end:                                           ; preds = %for.end, %entry
  ret void, !dbg !162
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_11_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 8, scope: !11)
!18 = !DILocalVariable(name: "src", scope: !19, file: !12, line: 27, type: !21)
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
!30 = !DILocation(line: 27, column: 28, scope: !19)
!31 = !DILocalVariable(name: "i", scope: !19, file: !12, line: 28, type: !32)
!32 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!33 = !DILocation(line: 28, column: 17, scope: !19)
!34 = !DILocation(line: 30, column: 13, scope: !19)
!35 = !DILocation(line: 31, column: 13, scope: !19)
!36 = !DILocation(line: 31, column: 22, scope: !19)
!37 = !DILocation(line: 32, column: 18, scope: !38)
!38 = distinct !DILexicalBlock(scope: !19, file: !12, line: 32, column: 13)
!39 = !DILocation(line: 32, column: 17, scope: !38)
!40 = !DILocation(line: 32, column: 22, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 32, column: 13)
!42 = !DILocation(line: 32, column: 24, scope: !41)
!43 = !DILocation(line: 32, column: 13, scope: !38)
!44 = !DILocation(line: 34, column: 31, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 33, column: 13)
!46 = !DILocation(line: 34, column: 27, scope: !45)
!47 = !DILocation(line: 34, column: 22, scope: !45)
!48 = !DILocation(line: 34, column: 17, scope: !45)
!49 = !DILocation(line: 34, column: 25, scope: !45)
!50 = !DILocation(line: 35, column: 13, scope: !45)
!51 = !DILocation(line: 32, column: 31, scope: !41)
!52 = !DILocation(line: 32, column: 13, scope: !41)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 35, column: 13, scope: !38)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 37, column: 23, scope: !19)
!57 = !DILocation(line: 37, column: 13, scope: !19)
!58 = !DILocation(line: 39, column: 5, scope: !20)
!59 = !DILocation(line: 40, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_11_good", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 95, column: 5, scope: !60)
!62 = !DILocation(line: 96, column: 5, scope: !60)
!63 = !DILocation(line: 97, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 108, type: !65, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!32, !32, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !12, line: 108, type: !32)
!70 = !DILocation(line: 108, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !12, line: 108, type: !67)
!72 = !DILocation(line: 108, column: 27, scope: !64)
!73 = !DILocation(line: 111, column: 22, scope: !64)
!74 = !DILocation(line: 111, column: 12, scope: !64)
!75 = !DILocation(line: 111, column: 5, scope: !64)
!76 = !DILocation(line: 113, column: 5, scope: !64)
!77 = !DILocation(line: 114, column: 5, scope: !64)
!78 = !DILocation(line: 115, column: 5, scope: !64)
!79 = !DILocation(line: 118, column: 5, scope: !64)
!80 = !DILocation(line: 119, column: 5, scope: !64)
!81 = !DILocation(line: 120, column: 5, scope: !64)
!82 = !DILocation(line: 122, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 49, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !83, file: !12, line: 49, column: 8)
!86 = !DILocation(line: 49, column: 8, scope: !83)
!87 = !DILocation(line: 52, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !12, line: 50, column: 5)
!89 = !DILocation(line: 53, column: 5, scope: !88)
!90 = !DILocalVariable(name: "src", scope: !91, file: !12, line: 57, type: !21)
!91 = distinct !DILexicalBlock(scope: !92, file: !12, line: 56, column: 9)
!92 = distinct !DILexicalBlock(scope: !85, file: !12, line: 55, column: 5)
!93 = !DILocation(line: 57, column: 18, scope: !91)
!94 = !DILocalVariable(name: "dest", scope: !91, file: !12, line: 57, type: !27)
!95 = !DILocation(line: 57, column: 28, scope: !91)
!96 = !DILocalVariable(name: "i", scope: !91, file: !12, line: 58, type: !32)
!97 = !DILocation(line: 58, column: 17, scope: !91)
!98 = !DILocation(line: 60, column: 13, scope: !91)
!99 = !DILocation(line: 61, column: 13, scope: !91)
!100 = !DILocation(line: 61, column: 22, scope: !91)
!101 = !DILocation(line: 62, column: 18, scope: !102)
!102 = distinct !DILexicalBlock(scope: !91, file: !12, line: 62, column: 13)
!103 = !DILocation(line: 62, column: 17, scope: !102)
!104 = !DILocation(line: 62, column: 22, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !12, line: 62, column: 13)
!106 = !DILocation(line: 62, column: 24, scope: !105)
!107 = !DILocation(line: 62, column: 13, scope: !102)
!108 = !DILocation(line: 64, column: 31, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !12, line: 63, column: 13)
!110 = !DILocation(line: 64, column: 27, scope: !109)
!111 = !DILocation(line: 64, column: 22, scope: !109)
!112 = !DILocation(line: 64, column: 17, scope: !109)
!113 = !DILocation(line: 64, column: 25, scope: !109)
!114 = !DILocation(line: 65, column: 13, scope: !109)
!115 = !DILocation(line: 62, column: 31, scope: !105)
!116 = !DILocation(line: 62, column: 13, scope: !105)
!117 = distinct !{!117, !107, !118, !55}
!118 = !DILocation(line: 65, column: 13, scope: !102)
!119 = !DILocation(line: 66, column: 13, scope: !91)
!120 = !DILocation(line: 66, column: 22, scope: !91)
!121 = !DILocation(line: 67, column: 23, scope: !91)
!122 = !DILocation(line: 67, column: 13, scope: !91)
!123 = !DILocation(line: 70, column: 1, scope: !83)
!124 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocation(line: 75, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !124, file: !12, line: 75, column: 8)
!127 = !DILocation(line: 75, column: 8, scope: !124)
!128 = !DILocalVariable(name: "src", scope: !129, file: !12, line: 78, type: !21)
!129 = distinct !DILexicalBlock(scope: !130, file: !12, line: 77, column: 9)
!130 = distinct !DILexicalBlock(scope: !126, file: !12, line: 76, column: 5)
!131 = !DILocation(line: 78, column: 18, scope: !129)
!132 = !DILocalVariable(name: "dest", scope: !129, file: !12, line: 78, type: !27)
!133 = !DILocation(line: 78, column: 28, scope: !129)
!134 = !DILocalVariable(name: "i", scope: !129, file: !12, line: 79, type: !32)
!135 = !DILocation(line: 79, column: 17, scope: !129)
!136 = !DILocation(line: 81, column: 13, scope: !129)
!137 = !DILocation(line: 82, column: 13, scope: !129)
!138 = !DILocation(line: 82, column: 22, scope: !129)
!139 = !DILocation(line: 83, column: 18, scope: !140)
!140 = distinct !DILexicalBlock(scope: !129, file: !12, line: 83, column: 13)
!141 = !DILocation(line: 83, column: 17, scope: !140)
!142 = !DILocation(line: 83, column: 22, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !12, line: 83, column: 13)
!144 = !DILocation(line: 83, column: 24, scope: !143)
!145 = !DILocation(line: 83, column: 13, scope: !140)
!146 = !DILocation(line: 85, column: 31, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !12, line: 84, column: 13)
!148 = !DILocation(line: 85, column: 27, scope: !147)
!149 = !DILocation(line: 85, column: 22, scope: !147)
!150 = !DILocation(line: 85, column: 17, scope: !147)
!151 = !DILocation(line: 85, column: 25, scope: !147)
!152 = !DILocation(line: 86, column: 13, scope: !147)
!153 = !DILocation(line: 83, column: 31, scope: !143)
!154 = !DILocation(line: 83, column: 13, scope: !143)
!155 = distinct !{!155, !145, !156, !55}
!156 = !DILocation(line: 86, column: 13, scope: !140)
!157 = !DILocation(line: 87, column: 13, scope: !129)
!158 = !DILocation(line: 87, column: 22, scope: !129)
!159 = !DILocation(line: 88, column: 23, scope: !129)
!160 = !DILocation(line: 88, column: 13, scope: !129)
!161 = !DILocation(line: 90, column: 5, scope: !130)
!162 = !DILocation(line: 91, column: 1, scope: !124)
