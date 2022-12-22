; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_17_bad() #0 !dbg !16 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %i3 = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp slt i32 %0, 1, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !32
  %1 = bitcast i8* %call to i32*, !dbg !34
  store i32* %1, i32** %data, align 8, !dbg !35
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %cmp1 = icmp eq i32* %2, null, !dbg !38
  br i1 %cmp1, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %data, align 8, !dbg !42
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %5, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !52, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !59, metadata !DIExpression()), !dbg !63
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !65
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !66
  store i32 0, i32* %arrayidx5, align 4, !dbg !67
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !68
  %call7 = call i64 @wcslen(i32* %arraydecay6) #8, !dbg !69
  store i64 %call7, i64* %destLen, align 8, !dbg !70
  store i64 0, i64* %i3, align 8, !dbg !71
  br label %for.cond8, !dbg !73

for.cond8:                                        ; preds = %for.inc13, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !74
  %7 = load i64, i64* %destLen, align 8, !dbg !76
  %cmp9 = icmp ult i64 %6, %7, !dbg !77
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !78

for.body10:                                       ; preds = %for.cond8
  %8 = load i32*, i32** %data, align 8, !dbg !79
  %9 = load i64, i64* %i3, align 8, !dbg !81
  %arrayidx11 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !79
  %10 = load i32, i32* %arrayidx11, align 4, !dbg !79
  %11 = load i64, i64* %i3, align 8, !dbg !82
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !83
  store i32 %10, i32* %arrayidx12, align 4, !dbg !84
  br label %for.inc13, !dbg !85

for.inc13:                                        ; preds = %for.body10
  %12 = load i64, i64* %i3, align 8, !dbg !86
  %inc14 = add i64 %12, 1, !dbg !86
  store i64 %inc14, i64* %i3, align 8, !dbg !86
  br label %for.cond8, !dbg !87, !llvm.loop !88

for.end15:                                        ; preds = %for.cond8
  %arrayidx16 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !90
  store i32 0, i32* %arrayidx16, align 4, !dbg !91
  %arraydecay17 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !92
  call void @printWLine(i32* %arraydecay17), !dbg !93
  %13 = load i32*, i32** %data, align 8, !dbg !94
  %14 = bitcast i32* %13 to i8*, !dbg !94
  call void @free(i8* %14) #6, !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_17_good() #0 !dbg !97 {
entry:
  call void @goodG2B(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i64 @time(i64* null) #6, !dbg !110
  %conv = trunc i64 %call to i32, !dbg !111
  call void @srand(i32 %conv) #6, !dbg !112
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !113
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_17_good(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !116
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_17_bad(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !120 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32** %data, metadata !123, metadata !DIExpression()), !dbg !124
  store i32* null, i32** %data, align 8, !dbg !125
  store i32 0, i32* %h, align 4, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !129
  %cmp = icmp slt i32 %0, 1, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !133
  %1 = bitcast i8* %call to i32*, !dbg !135
  store i32* %1, i32** %data, align 8, !dbg !136
  %2 = load i32*, i32** %data, align 8, !dbg !137
  %cmp1 = icmp eq i32* %2, null, !dbg !139
  br i1 %cmp1, label %if.then, label %if.end, !dbg !140

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !141
  unreachable, !dbg !141

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %data, align 8, !dbg !143
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !144
  %4 = load i32*, i32** %data, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !145
  store i32 0, i32* %arrayidx, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %h, align 4, !dbg !148
  %inc = add nsw i32 %5, 1, !dbg !148
  store i32 %inc, i32* %h, align 4, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i, metadata !152, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !157, metadata !DIExpression()), !dbg !158
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !159
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !160
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !161
  store i32 0, i32* %arrayidx4, align 4, !dbg !162
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !163
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !164
  store i64 %call6, i64* %destLen, align 8, !dbg !165
  store i64 0, i64* %i, align 8, !dbg !166
  br label %for.cond7, !dbg !168

for.cond7:                                        ; preds = %for.inc12, %for.end
  %6 = load i64, i64* %i, align 8, !dbg !169
  %7 = load i64, i64* %destLen, align 8, !dbg !171
  %cmp8 = icmp ult i64 %6, %7, !dbg !172
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !173

for.body9:                                        ; preds = %for.cond7
  %8 = load i32*, i32** %data, align 8, !dbg !174
  %9 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx10 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !174
  %10 = load i32, i32* %arrayidx10, align 4, !dbg !174
  %11 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !178
  store i32 %10, i32* %arrayidx11, align 4, !dbg !179
  br label %for.inc12, !dbg !180

for.inc12:                                        ; preds = %for.body9
  %12 = load i64, i64* %i, align 8, !dbg !181
  %inc13 = add i64 %12, 1, !dbg !181
  store i64 %inc13, i64* %i, align 8, !dbg !181
  br label %for.cond7, !dbg !182, !llvm.loop !183

for.end14:                                        ; preds = %for.cond7
  %arrayidx15 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !185
  store i32 0, i32* %arrayidx15, align 4, !dbg !186
  %arraydecay16 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !187
  call void @printWLine(i32* %arraydecay16), !dbg !188
  %13 = load i32*, i32** %data, align 8, !dbg !189
  %14 = bitcast i32* %13 to i8*, !dbg !189
  call void @free(i8* %14) #6, !dbg !190
  ret void, !dbg !191
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_17_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_17.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "i", scope: !16, file: !17, line: 25, type: !7)
!21 = !DILocation(line: 25, column: 9, scope: !16)
!22 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 15, scope: !16)
!24 = !DILocation(line: 27, column: 10, scope: !16)
!25 = !DILocation(line: 28, column: 11, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 5)
!27 = !DILocation(line: 28, column: 9, scope: !26)
!28 = !DILocation(line: 28, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !17, line: 28, column: 5)
!30 = !DILocation(line: 28, column: 18, scope: !29)
!31 = !DILocation(line: 28, column: 5, scope: !26)
!32 = !DILocation(line: 31, column: 27, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 5)
!34 = !DILocation(line: 31, column: 16, scope: !33)
!35 = !DILocation(line: 31, column: 14, scope: !33)
!36 = !DILocation(line: 32, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 32, column: 13)
!38 = !DILocation(line: 32, column: 18, scope: !37)
!39 = !DILocation(line: 32, column: 13, scope: !33)
!40 = !DILocation(line: 32, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 32, column: 27)
!42 = !DILocation(line: 33, column: 17, scope: !33)
!43 = !DILocation(line: 33, column: 9, scope: !33)
!44 = !DILocation(line: 34, column: 9, scope: !33)
!45 = !DILocation(line: 34, column: 20, scope: !33)
!46 = !DILocation(line: 35, column: 5, scope: !33)
!47 = !DILocation(line: 28, column: 24, scope: !29)
!48 = !DILocation(line: 28, column: 5, scope: !29)
!49 = distinct !{!49, !31, !50, !51}
!50 = !DILocation(line: 35, column: 5, scope: !26)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocalVariable(name: "i", scope: !53, file: !17, line: 37, type: !54)
!53 = distinct !DILexicalBlock(scope: !16, file: !17, line: 36, column: 5)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !55)
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 37, column: 16, scope: !53)
!57 = !DILocalVariable(name: "destLen", scope: !53, file: !17, line: 37, type: !54)
!58 = !DILocation(line: 37, column: 19, scope: !53)
!59 = !DILocalVariable(name: "dest", scope: !53, file: !17, line: 38, type: !60)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 100)
!63 = !DILocation(line: 38, column: 17, scope: !53)
!64 = !DILocation(line: 39, column: 17, scope: !53)
!65 = !DILocation(line: 39, column: 9, scope: !53)
!66 = !DILocation(line: 40, column: 9, scope: !53)
!67 = !DILocation(line: 40, column: 21, scope: !53)
!68 = !DILocation(line: 41, column: 26, scope: !53)
!69 = !DILocation(line: 41, column: 19, scope: !53)
!70 = !DILocation(line: 41, column: 17, scope: !53)
!71 = !DILocation(line: 44, column: 16, scope: !72)
!72 = distinct !DILexicalBlock(scope: !53, file: !17, line: 44, column: 9)
!73 = !DILocation(line: 44, column: 14, scope: !72)
!74 = !DILocation(line: 44, column: 21, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !17, line: 44, column: 9)
!76 = !DILocation(line: 44, column: 25, scope: !75)
!77 = !DILocation(line: 44, column: 23, scope: !75)
!78 = !DILocation(line: 44, column: 9, scope: !72)
!79 = !DILocation(line: 46, column: 23, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !17, line: 45, column: 9)
!81 = !DILocation(line: 46, column: 28, scope: !80)
!82 = !DILocation(line: 46, column: 18, scope: !80)
!83 = !DILocation(line: 46, column: 13, scope: !80)
!84 = !DILocation(line: 46, column: 21, scope: !80)
!85 = !DILocation(line: 47, column: 9, scope: !80)
!86 = !DILocation(line: 44, column: 35, scope: !75)
!87 = !DILocation(line: 44, column: 9, scope: !75)
!88 = distinct !{!88, !78, !89, !51}
!89 = !DILocation(line: 47, column: 9, scope: !72)
!90 = !DILocation(line: 48, column: 9, scope: !53)
!91 = !DILocation(line: 48, column: 21, scope: !53)
!92 = !DILocation(line: 49, column: 20, scope: !53)
!93 = !DILocation(line: 49, column: 9, scope: !53)
!94 = !DILocation(line: 50, column: 14, scope: !53)
!95 = !DILocation(line: 50, column: 9, scope: !53)
!96 = !DILocation(line: 52, column: 1, scope: !16)
!97 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_17_good", scope: !17, file: !17, line: 90, type: !18, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 92, column: 5, scope: !97)
!99 = !DILocation(line: 93, column: 1, scope: !97)
!100 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 105, type: !101, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!7, !7, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !17, line: 105, type: !7)
!107 = !DILocation(line: 105, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !17, line: 105, type: !103)
!109 = !DILocation(line: 105, column: 27, scope: !100)
!110 = !DILocation(line: 108, column: 22, scope: !100)
!111 = !DILocation(line: 108, column: 12, scope: !100)
!112 = !DILocation(line: 108, column: 5, scope: !100)
!113 = !DILocation(line: 110, column: 5, scope: !100)
!114 = !DILocation(line: 111, column: 5, scope: !100)
!115 = !DILocation(line: 112, column: 5, scope: !100)
!116 = !DILocation(line: 115, column: 5, scope: !100)
!117 = !DILocation(line: 116, column: 5, scope: !100)
!118 = !DILocation(line: 117, column: 5, scope: !100)
!119 = !DILocation(line: 119, column: 5, scope: !100)
!120 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "h", scope: !120, file: !17, line: 61, type: !7)
!122 = !DILocation(line: 61, column: 9, scope: !120)
!123 = !DILocalVariable(name: "data", scope: !120, file: !17, line: 62, type: !4)
!124 = !DILocation(line: 62, column: 15, scope: !120)
!125 = !DILocation(line: 63, column: 10, scope: !120)
!126 = !DILocation(line: 64, column: 11, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !17, line: 64, column: 5)
!128 = !DILocation(line: 64, column: 9, scope: !127)
!129 = !DILocation(line: 64, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !17, line: 64, column: 5)
!131 = !DILocation(line: 64, column: 18, scope: !130)
!132 = !DILocation(line: 64, column: 5, scope: !127)
!133 = !DILocation(line: 67, column: 27, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !17, line: 65, column: 5)
!135 = !DILocation(line: 67, column: 16, scope: !134)
!136 = !DILocation(line: 67, column: 14, scope: !134)
!137 = !DILocation(line: 68, column: 13, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !17, line: 68, column: 13)
!139 = !DILocation(line: 68, column: 18, scope: !138)
!140 = !DILocation(line: 68, column: 13, scope: !134)
!141 = !DILocation(line: 68, column: 28, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !17, line: 68, column: 27)
!143 = !DILocation(line: 69, column: 17, scope: !134)
!144 = !DILocation(line: 69, column: 9, scope: !134)
!145 = !DILocation(line: 70, column: 9, scope: !134)
!146 = !DILocation(line: 70, column: 21, scope: !134)
!147 = !DILocation(line: 71, column: 5, scope: !134)
!148 = !DILocation(line: 64, column: 24, scope: !130)
!149 = !DILocation(line: 64, column: 5, scope: !130)
!150 = distinct !{!150, !132, !151, !51}
!151 = !DILocation(line: 71, column: 5, scope: !127)
!152 = !DILocalVariable(name: "i", scope: !153, file: !17, line: 73, type: !54)
!153 = distinct !DILexicalBlock(scope: !120, file: !17, line: 72, column: 5)
!154 = !DILocation(line: 73, column: 16, scope: !153)
!155 = !DILocalVariable(name: "destLen", scope: !153, file: !17, line: 73, type: !54)
!156 = !DILocation(line: 73, column: 19, scope: !153)
!157 = !DILocalVariable(name: "dest", scope: !153, file: !17, line: 74, type: !60)
!158 = !DILocation(line: 74, column: 17, scope: !153)
!159 = !DILocation(line: 75, column: 17, scope: !153)
!160 = !DILocation(line: 75, column: 9, scope: !153)
!161 = !DILocation(line: 76, column: 9, scope: !153)
!162 = !DILocation(line: 76, column: 21, scope: !153)
!163 = !DILocation(line: 77, column: 26, scope: !153)
!164 = !DILocation(line: 77, column: 19, scope: !153)
!165 = !DILocation(line: 77, column: 17, scope: !153)
!166 = !DILocation(line: 80, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !153, file: !17, line: 80, column: 9)
!168 = !DILocation(line: 80, column: 14, scope: !167)
!169 = !DILocation(line: 80, column: 21, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !17, line: 80, column: 9)
!171 = !DILocation(line: 80, column: 25, scope: !170)
!172 = !DILocation(line: 80, column: 23, scope: !170)
!173 = !DILocation(line: 80, column: 9, scope: !167)
!174 = !DILocation(line: 82, column: 23, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !17, line: 81, column: 9)
!176 = !DILocation(line: 82, column: 28, scope: !175)
!177 = !DILocation(line: 82, column: 18, scope: !175)
!178 = !DILocation(line: 82, column: 13, scope: !175)
!179 = !DILocation(line: 82, column: 21, scope: !175)
!180 = !DILocation(line: 83, column: 9, scope: !175)
!181 = !DILocation(line: 80, column: 35, scope: !170)
!182 = !DILocation(line: 80, column: 9, scope: !170)
!183 = distinct !{!183, !173, !184, !51}
!184 = !DILocation(line: 83, column: 9, scope: !167)
!185 = !DILocation(line: 84, column: 9, scope: !153)
!186 = !DILocation(line: 84, column: 21, scope: !153)
!187 = !DILocation(line: 85, column: 20, scope: !153)
!188 = !DILocation(line: 85, column: 9, scope: !153)
!189 = !DILocation(line: 86, column: 14, scope: !153)
!190 = !DILocation(line: 86, column: 9, scope: !153)
!191 = !DILocation(line: 88, column: 1, scope: !120)
