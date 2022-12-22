; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_12_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %src6 = alloca [150 x i32], align 16
  %dest7 = alloca [100 x i32], align 16
  %i8 = alloca i32, align 4
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !15
  %tobool = icmp ne i32 %call, 0, !dbg !15
  br i1 %tobool, label %if.then, label %if.else, !dbg !17

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !18, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %i, metadata !33, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !35
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !36
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i32, i32* %i, align 4, !dbg !42
  %cmp = icmp slt i32 %0, 99, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !46
  %idxprom = sext i32 %1 to i64, !dbg !48
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !48
  %2 = load i32, i32* %arrayidx2, align 4, !dbg !48
  %3 = load i32, i32* %i, align 4, !dbg !49
  %idxprom3 = sext i32 %3 to i64, !dbg !50
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !50
  store i32 %2, i32* %arrayidx4, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %4, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay5), !dbg !59
  br label %if.end, !dbg !60

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src6, metadata !61, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest7, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32* %i8, metadata !67, metadata !DIExpression()), !dbg !68
  %arraydecay9 = getelementptr inbounds [150 x i32], [150 x i32]* %src6, i64 0, i64 0, !dbg !69
  %call10 = call i32* @wmemset(i32* %arraydecay9, i32 65, i64 149) #4, !dbg !70
  %arrayidx11 = getelementptr inbounds [150 x i32], [150 x i32]* %src6, i64 0, i64 149, !dbg !71
  store i32 0, i32* %arrayidx11, align 4, !dbg !72
  store i32 0, i32* %i8, align 4, !dbg !73
  br label %for.cond12, !dbg !75

for.cond12:                                       ; preds = %for.inc19, %if.else
  %5 = load i32, i32* %i8, align 4, !dbg !76
  %cmp13 = icmp slt i32 %5, 99, !dbg !78
  br i1 %cmp13, label %for.body14, label %for.end21, !dbg !79

for.body14:                                       ; preds = %for.cond12
  %6 = load i32, i32* %i8, align 4, !dbg !80
  %idxprom15 = sext i32 %6 to i64, !dbg !82
  %arrayidx16 = getelementptr inbounds [150 x i32], [150 x i32]* %src6, i64 0, i64 %idxprom15, !dbg !82
  %7 = load i32, i32* %arrayidx16, align 4, !dbg !82
  %8 = load i32, i32* %i8, align 4, !dbg !83
  %idxprom17 = sext i32 %8 to i64, !dbg !84
  %arrayidx18 = getelementptr inbounds [100 x i32], [100 x i32]* %dest7, i64 0, i64 %idxprom17, !dbg !84
  store i32 %7, i32* %arrayidx18, align 4, !dbg !85
  br label %for.inc19, !dbg !86

for.inc19:                                        ; preds = %for.body14
  %9 = load i32, i32* %i8, align 4, !dbg !87
  %inc20 = add nsw i32 %9, 1, !dbg !87
  store i32 %inc20, i32* %i8, align 4, !dbg !87
  br label %for.cond12, !dbg !88, !llvm.loop !89

for.end21:                                        ; preds = %for.cond12
  %arrayidx22 = getelementptr inbounds [100 x i32], [100 x i32]* %dest7, i64 0, i64 99, !dbg !91
  store i32 0, i32* %arrayidx22, align 4, !dbg !92
  %arraydecay23 = getelementptr inbounds [100 x i32], [100 x i32]* %dest7, i64 0, i64 0, !dbg !93
  call void @printWLine(i32* %arraydecay23), !dbg !94
  br label %if.end

if.end:                                           ; preds = %for.end21, %for.end
  ret void, !dbg !95
}

declare dso_local i32 @globalReturnsTrueOrFalse(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

declare dso_local void @printWLine(i32*) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_12_good() #0 !dbg !96 {
entry:
  call void @good1(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i64 @time(i64* null) #4, !dbg !109
  %conv = trunc i64 %call to i32, !dbg !110
  call void @srand(i32 %conv) #4, !dbg !111
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !112
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_12_good(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !115
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_12_bad(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !119 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  %src7 = alloca [150 x i32], align 16
  %dest8 = alloca [100 x i32], align 16
  %i9 = alloca i32, align 4
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !120
  %tobool = icmp ne i32 %call, 0, !dbg !120
  br i1 %tobool, label %if.then, label %if.else, !dbg !122

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !123, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i32* %i, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !131
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !132
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !134
  store i32 0, i32* %i, align 4, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i32, i32* %i, align 4, !dbg !138
  %cmp = icmp slt i32 %0, 99, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !142
  %idxprom = sext i32 %1 to i64, !dbg !144
  %arrayidx2 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !144
  %2 = load i32, i32* %arrayidx2, align 4, !dbg !144
  %3 = load i32, i32* %i, align 4, !dbg !145
  %idxprom3 = sext i32 %3 to i64, !dbg !146
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom3, !dbg !146
  store i32 %2, i32* %arrayidx4, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !149
  %inc = add nsw i32 %4, 1, !dbg !149
  store i32 %inc, i32* %i, align 4, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !153
  store i32 0, i32* %arrayidx5, align 4, !dbg !154
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !155
  call void @printWLine(i32* %arraydecay6), !dbg !156
  br label %if.end, !dbg !157

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src7, metadata !158, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest8, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i32* %i9, metadata !164, metadata !DIExpression()), !dbg !165
  %arraydecay10 = getelementptr inbounds [150 x i32], [150 x i32]* %src7, i64 0, i64 0, !dbg !166
  %call11 = call i32* @wmemset(i32* %arraydecay10, i32 65, i64 149) #4, !dbg !167
  %arrayidx12 = getelementptr inbounds [150 x i32], [150 x i32]* %src7, i64 0, i64 149, !dbg !168
  store i32 0, i32* %arrayidx12, align 4, !dbg !169
  store i32 0, i32* %i9, align 4, !dbg !170
  br label %for.cond13, !dbg !172

for.cond13:                                       ; preds = %for.inc20, %if.else
  %5 = load i32, i32* %i9, align 4, !dbg !173
  %cmp14 = icmp slt i32 %5, 99, !dbg !175
  br i1 %cmp14, label %for.body15, label %for.end22, !dbg !176

for.body15:                                       ; preds = %for.cond13
  %6 = load i32, i32* %i9, align 4, !dbg !177
  %idxprom16 = sext i32 %6 to i64, !dbg !179
  %arrayidx17 = getelementptr inbounds [150 x i32], [150 x i32]* %src7, i64 0, i64 %idxprom16, !dbg !179
  %7 = load i32, i32* %arrayidx17, align 4, !dbg !179
  %8 = load i32, i32* %i9, align 4, !dbg !180
  %idxprom18 = sext i32 %8 to i64, !dbg !181
  %arrayidx19 = getelementptr inbounds [100 x i32], [100 x i32]* %dest8, i64 0, i64 %idxprom18, !dbg !181
  store i32 %7, i32* %arrayidx19, align 4, !dbg !182
  br label %for.inc20, !dbg !183

for.inc20:                                        ; preds = %for.body15
  %9 = load i32, i32* %i9, align 4, !dbg !184
  %inc21 = add nsw i32 %9, 1, !dbg !184
  store i32 %inc21, i32* %i9, align 4, !dbg !184
  br label %for.cond13, !dbg !185, !llvm.loop !186

for.end22:                                        ; preds = %for.cond13
  %arrayidx23 = getelementptr inbounds [100 x i32], [100 x i32]* %dest8, i64 0, i64 99, !dbg !188
  store i32 0, i32* %arrayidx23, align 4, !dbg !189
  %arraydecay24 = getelementptr inbounds [100 x i32], [100 x i32]* %dest8, i64 0, i64 0, !dbg !190
  call void @printWLine(i32* %arraydecay24), !dbg !191
  br label %if.end

if.end:                                           ; preds = %for.end22, %for.end
  ret void, !dbg !192
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_12_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 8, scope: !11)
!18 = !DILocalVariable(name: "src", scope: !19, file: !12, line: 27, type: !21)
!19 = distinct !DILexicalBlock(scope: !20, file: !12, line: 26, column: 9)
!20 = distinct !DILexicalBlock(scope: !16, file: !12, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 4800, elements: !25)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !23, line: 74, baseType: !24)
!23 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{!26}
!26 = !DISubrange(count: 150)
!27 = !DILocation(line: 27, column: 21, scope: !19)
!28 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 27, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 27, column: 31, scope: !19)
!33 = !DILocalVariable(name: "i", scope: !19, file: !12, line: 28, type: !24)
!34 = !DILocation(line: 28, column: 17, scope: !19)
!35 = !DILocation(line: 30, column: 21, scope: !19)
!36 = !DILocation(line: 30, column: 13, scope: !19)
!37 = !DILocation(line: 31, column: 13, scope: !19)
!38 = !DILocation(line: 31, column: 22, scope: !19)
!39 = !DILocation(line: 32, column: 18, scope: !40)
!40 = distinct !DILexicalBlock(scope: !19, file: !12, line: 32, column: 13)
!41 = !DILocation(line: 32, column: 17, scope: !40)
!42 = !DILocation(line: 32, column: 22, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 32, column: 13)
!44 = !DILocation(line: 32, column: 24, scope: !43)
!45 = !DILocation(line: 32, column: 13, scope: !40)
!46 = !DILocation(line: 34, column: 31, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 33, column: 13)
!48 = !DILocation(line: 34, column: 27, scope: !47)
!49 = !DILocation(line: 34, column: 22, scope: !47)
!50 = !DILocation(line: 34, column: 17, scope: !47)
!51 = !DILocation(line: 34, column: 25, scope: !47)
!52 = !DILocation(line: 35, column: 13, scope: !47)
!53 = !DILocation(line: 32, column: 31, scope: !43)
!54 = !DILocation(line: 32, column: 13, scope: !43)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 35, column: 13, scope: !40)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 37, column: 24, scope: !19)
!59 = !DILocation(line: 37, column: 13, scope: !19)
!60 = !DILocation(line: 39, column: 5, scope: !20)
!61 = !DILocalVariable(name: "src", scope: !62, file: !12, line: 43, type: !21)
!62 = distinct !DILexicalBlock(scope: !63, file: !12, line: 42, column: 9)
!63 = distinct !DILexicalBlock(scope: !16, file: !12, line: 41, column: 5)
!64 = !DILocation(line: 43, column: 21, scope: !62)
!65 = !DILocalVariable(name: "dest", scope: !62, file: !12, line: 43, type: !29)
!66 = !DILocation(line: 43, column: 31, scope: !62)
!67 = !DILocalVariable(name: "i", scope: !62, file: !12, line: 44, type: !24)
!68 = !DILocation(line: 44, column: 17, scope: !62)
!69 = !DILocation(line: 46, column: 21, scope: !62)
!70 = !DILocation(line: 46, column: 13, scope: !62)
!71 = !DILocation(line: 47, column: 13, scope: !62)
!72 = !DILocation(line: 47, column: 22, scope: !62)
!73 = !DILocation(line: 48, column: 18, scope: !74)
!74 = distinct !DILexicalBlock(scope: !62, file: !12, line: 48, column: 13)
!75 = !DILocation(line: 48, column: 17, scope: !74)
!76 = !DILocation(line: 48, column: 22, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !12, line: 48, column: 13)
!78 = !DILocation(line: 48, column: 24, scope: !77)
!79 = !DILocation(line: 48, column: 13, scope: !74)
!80 = !DILocation(line: 50, column: 31, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !12, line: 49, column: 13)
!82 = !DILocation(line: 50, column: 27, scope: !81)
!83 = !DILocation(line: 50, column: 22, scope: !81)
!84 = !DILocation(line: 50, column: 17, scope: !81)
!85 = !DILocation(line: 50, column: 25, scope: !81)
!86 = !DILocation(line: 51, column: 13, scope: !81)
!87 = !DILocation(line: 48, column: 31, scope: !77)
!88 = !DILocation(line: 48, column: 13, scope: !77)
!89 = distinct !{!89, !79, !90, !57}
!90 = !DILocation(line: 51, column: 13, scope: !74)
!91 = !DILocation(line: 52, column: 13, scope: !62)
!92 = !DILocation(line: 52, column: 22, scope: !62)
!93 = !DILocation(line: 53, column: 24, scope: !62)
!94 = !DILocation(line: 53, column: 13, scope: !62)
!95 = !DILocation(line: 56, column: 1, scope: !11)
!96 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_12_good", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocation(line: 101, column: 5, scope: !96)
!98 = !DILocation(line: 102, column: 1, scope: !96)
!99 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 113, type: !100, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!24, !24, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !12, line: 113, type: !24)
!106 = !DILocation(line: 113, column: 14, scope: !99)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !12, line: 113, type: !102)
!108 = !DILocation(line: 113, column: 27, scope: !99)
!109 = !DILocation(line: 116, column: 22, scope: !99)
!110 = !DILocation(line: 116, column: 12, scope: !99)
!111 = !DILocation(line: 116, column: 5, scope: !99)
!112 = !DILocation(line: 118, column: 5, scope: !99)
!113 = !DILocation(line: 119, column: 5, scope: !99)
!114 = !DILocation(line: 120, column: 5, scope: !99)
!115 = !DILocation(line: 123, column: 5, scope: !99)
!116 = !DILocation(line: 124, column: 5, scope: !99)
!117 = !DILocation(line: 125, column: 5, scope: !99)
!118 = !DILocation(line: 127, column: 5, scope: !99)
!119 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocation(line: 65, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !119, file: !12, line: 65, column: 8)
!122 = !DILocation(line: 65, column: 8, scope: !119)
!123 = !DILocalVariable(name: "src", scope: !124, file: !12, line: 68, type: !21)
!124 = distinct !DILexicalBlock(scope: !125, file: !12, line: 67, column: 9)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 66, column: 5)
!126 = !DILocation(line: 68, column: 21, scope: !124)
!127 = !DILocalVariable(name: "dest", scope: !124, file: !12, line: 68, type: !29)
!128 = !DILocation(line: 68, column: 31, scope: !124)
!129 = !DILocalVariable(name: "i", scope: !124, file: !12, line: 69, type: !24)
!130 = !DILocation(line: 69, column: 17, scope: !124)
!131 = !DILocation(line: 71, column: 21, scope: !124)
!132 = !DILocation(line: 71, column: 13, scope: !124)
!133 = !DILocation(line: 72, column: 13, scope: !124)
!134 = !DILocation(line: 72, column: 22, scope: !124)
!135 = !DILocation(line: 73, column: 18, scope: !136)
!136 = distinct !DILexicalBlock(scope: !124, file: !12, line: 73, column: 13)
!137 = !DILocation(line: 73, column: 17, scope: !136)
!138 = !DILocation(line: 73, column: 22, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 73, column: 13)
!140 = !DILocation(line: 73, column: 24, scope: !139)
!141 = !DILocation(line: 73, column: 13, scope: !136)
!142 = !DILocation(line: 75, column: 31, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !12, line: 74, column: 13)
!144 = !DILocation(line: 75, column: 27, scope: !143)
!145 = !DILocation(line: 75, column: 22, scope: !143)
!146 = !DILocation(line: 75, column: 17, scope: !143)
!147 = !DILocation(line: 75, column: 25, scope: !143)
!148 = !DILocation(line: 76, column: 13, scope: !143)
!149 = !DILocation(line: 73, column: 31, scope: !139)
!150 = !DILocation(line: 73, column: 13, scope: !139)
!151 = distinct !{!151, !141, !152, !57}
!152 = !DILocation(line: 76, column: 13, scope: !136)
!153 = !DILocation(line: 77, column: 13, scope: !124)
!154 = !DILocation(line: 77, column: 22, scope: !124)
!155 = !DILocation(line: 78, column: 24, scope: !124)
!156 = !DILocation(line: 78, column: 13, scope: !124)
!157 = !DILocation(line: 80, column: 5, scope: !125)
!158 = !DILocalVariable(name: "src", scope: !159, file: !12, line: 84, type: !21)
!159 = distinct !DILexicalBlock(scope: !160, file: !12, line: 83, column: 9)
!160 = distinct !DILexicalBlock(scope: !121, file: !12, line: 82, column: 5)
!161 = !DILocation(line: 84, column: 21, scope: !159)
!162 = !DILocalVariable(name: "dest", scope: !159, file: !12, line: 84, type: !29)
!163 = !DILocation(line: 84, column: 31, scope: !159)
!164 = !DILocalVariable(name: "i", scope: !159, file: !12, line: 85, type: !24)
!165 = !DILocation(line: 85, column: 17, scope: !159)
!166 = !DILocation(line: 87, column: 21, scope: !159)
!167 = !DILocation(line: 87, column: 13, scope: !159)
!168 = !DILocation(line: 88, column: 13, scope: !159)
!169 = !DILocation(line: 88, column: 22, scope: !159)
!170 = !DILocation(line: 89, column: 18, scope: !171)
!171 = distinct !DILexicalBlock(scope: !159, file: !12, line: 89, column: 13)
!172 = !DILocation(line: 89, column: 17, scope: !171)
!173 = !DILocation(line: 89, column: 22, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !12, line: 89, column: 13)
!175 = !DILocation(line: 89, column: 24, scope: !174)
!176 = !DILocation(line: 89, column: 13, scope: !171)
!177 = !DILocation(line: 91, column: 31, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !12, line: 90, column: 13)
!179 = !DILocation(line: 91, column: 27, scope: !178)
!180 = !DILocation(line: 91, column: 22, scope: !178)
!181 = !DILocation(line: 91, column: 17, scope: !178)
!182 = !DILocation(line: 91, column: 25, scope: !178)
!183 = !DILocation(line: 92, column: 13, scope: !178)
!184 = !DILocation(line: 89, column: 31, scope: !174)
!185 = !DILocation(line: 89, column: 13, scope: !174)
!186 = distinct !{!186, !176, !187, !57}
!187 = !DILocation(line: 92, column: 13, scope: !171)
!188 = !DILocation(line: 93, column: 13, scope: !159)
!189 = !DILocation(line: 93, column: 22, scope: !159)
!190 = !DILocation(line: 94, column: 24, scope: !159)
!191 = !DILocation(line: 94, column: 13, scope: !159)
!192 = !DILocation(line: 97, column: 1, scope: !119)
