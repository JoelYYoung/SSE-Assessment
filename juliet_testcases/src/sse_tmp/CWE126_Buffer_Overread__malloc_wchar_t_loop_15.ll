; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !49
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx3, align 4, !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call5 = call i64 @wcslen(i32* %arraydecay4) #8, !dbg !53
  store i64 %call5, i64* %destLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !58
  %5 = load i64, i64* %destLen, align 8, !dbg !60
  %cmp6 = icmp ult i64 %4, %5, !dbg !61
  br i1 %cmp6, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !63
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !63
  %9 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !67
  store i32 %8, i32* %arrayidx8, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %10, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !75
  store i32 0, i32* %arrayidx9, align 4, !dbg !76
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !77
  call void @printWLine(i32* %arraydecay10), !dbg !78
  %11 = load i32*, i32** %data, align 8, !dbg !79
  %12 = bitcast i32* %11 to i8*, !dbg !79
  call void @free(i8* %12) #6, !dbg !80
  ret void, !dbg !81
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_15_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #6, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #6, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_15_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_15_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32* null, i32** %data, align 8, !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !110
  %0 = bitcast i8* %call to i32*, !dbg !111
  store i32* %0, i32** %data, align 8, !dbg !112
  %1 = load i32*, i32** %data, align 8, !dbg !113
  %cmp = icmp eq i32* %1, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !119
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !120
  %3 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !131
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx3, align 4, !dbg !133
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !134
  %call5 = call i64 @wcslen(i32* %arraydecay4) #8, !dbg !135
  store i64 %call5, i64* %destLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !140
  %5 = load i64, i64* %destLen, align 8, !dbg !142
  %cmp6 = icmp ult i64 %4, %5, !dbg !143
  br i1 %cmp6, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !145
  %7 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !145
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !145
  %9 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !149
  store i32 %8, i32* %arrayidx8, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %10, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !156
  store i32 0, i32* %arrayidx9, align 4, !dbg !157
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !158
  call void @printWLine(i32* %arraydecay10), !dbg !159
  %11 = load i32*, i32** %data, align 8, !dbg !160
  %12 = bitcast i32* %11 to i8*, !dbg !160
  call void @free(i8* %12) #6, !dbg !161
  ret void, !dbg !162
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !163 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !164, metadata !DIExpression()), !dbg !165
  store i32* null, i32** %data, align 8, !dbg !166
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !167
  %0 = bitcast i8* %call to i32*, !dbg !168
  store i32* %0, i32** %data, align 8, !dbg !169
  %1 = load i32*, i32** %data, align 8, !dbg !170
  %cmp = icmp eq i32* %1, null, !dbg !172
  br i1 %cmp, label %if.then, label %if.end, !dbg !173

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !174
  unreachable, !dbg !174

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !176
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !177
  %3 = load i32*, i32** %data, align 8, !dbg !178
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !178
  store i32 0, i32* %arrayidx, align 4, !dbg !179
  call void @llvm.dbg.declare(metadata i64* %i, metadata !180, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !185, metadata !DIExpression()), !dbg !186
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !187
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !188
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !189
  store i32 0, i32* %arrayidx3, align 4, !dbg !190
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !191
  %call5 = call i64 @wcslen(i32* %arraydecay4) #8, !dbg !192
  store i64 %call5, i64* %destLen, align 8, !dbg !193
  store i64 0, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !197
  %5 = load i64, i64* %destLen, align 8, !dbg !199
  %cmp6 = icmp ult i64 %4, %5, !dbg !200
  br i1 %cmp6, label %for.body, label %for.end, !dbg !201

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !202
  %7 = load i64, i64* %i, align 8, !dbg !204
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !202
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !202
  %9 = load i64, i64* %i, align 8, !dbg !205
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !206
  store i32 %8, i32* %arrayidx8, align 4, !dbg !207
  br label %for.inc, !dbg !208

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !209
  %inc = add i64 %10, 1, !dbg !209
  store i64 %inc, i64* %i, align 8, !dbg !209
  br label %for.cond, !dbg !210, !llvm.loop !211

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !213
  store i32 0, i32* %arrayidx9, align 4, !dbg !214
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !215
  call void @printWLine(i32* %arraydecay10), !dbg !216
  %11 = load i32*, i32** %data, align 8, !dbg !217
  %12 = bitcast i32* %11 to i8*, !dbg !217
  call void @free(i8* %12) #6, !dbg !218
  ret void, !dbg !219
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_15_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 31, column: 27, scope: !16)
!24 = !DILocation(line: 31, column: 16, scope: !16)
!25 = !DILocation(line: 31, column: 14, scope: !16)
!26 = !DILocation(line: 32, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 13)
!28 = !DILocation(line: 32, column: 18, scope: !27)
!29 = !DILocation(line: 32, column: 13, scope: !16)
!30 = !DILocation(line: 32, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 32, column: 27)
!32 = !DILocation(line: 33, column: 17, scope: !16)
!33 = !DILocation(line: 33, column: 9, scope: !16)
!34 = !DILocation(line: 34, column: 9, scope: !16)
!35 = !DILocation(line: 34, column: 20, scope: !16)
!36 = !DILocalVariable(name: "i", scope: !37, file: !17, line: 42, type: !38)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !39)
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 42, column: 16, scope: !37)
!41 = !DILocalVariable(name: "destLen", scope: !37, file: !17, line: 42, type: !38)
!42 = !DILocation(line: 42, column: 19, scope: !37)
!43 = !DILocalVariable(name: "dest", scope: !37, file: !17, line: 43, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 43, column: 17, scope: !37)
!48 = !DILocation(line: 44, column: 17, scope: !37)
!49 = !DILocation(line: 44, column: 9, scope: !37)
!50 = !DILocation(line: 45, column: 9, scope: !37)
!51 = !DILocation(line: 45, column: 21, scope: !37)
!52 = !DILocation(line: 46, column: 26, scope: !37)
!53 = !DILocation(line: 46, column: 19, scope: !37)
!54 = !DILocation(line: 46, column: 17, scope: !37)
!55 = !DILocation(line: 49, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !37, file: !17, line: 49, column: 9)
!57 = !DILocation(line: 49, column: 14, scope: !56)
!58 = !DILocation(line: 49, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !17, line: 49, column: 9)
!60 = !DILocation(line: 49, column: 25, scope: !59)
!61 = !DILocation(line: 49, column: 23, scope: !59)
!62 = !DILocation(line: 49, column: 9, scope: !56)
!63 = !DILocation(line: 51, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !17, line: 50, column: 9)
!65 = !DILocation(line: 51, column: 28, scope: !64)
!66 = !DILocation(line: 51, column: 18, scope: !64)
!67 = !DILocation(line: 51, column: 13, scope: !64)
!68 = !DILocation(line: 51, column: 21, scope: !64)
!69 = !DILocation(line: 52, column: 9, scope: !64)
!70 = !DILocation(line: 49, column: 35, scope: !59)
!71 = !DILocation(line: 49, column: 9, scope: !59)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 52, column: 9, scope: !56)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 53, column: 9, scope: !37)
!76 = !DILocation(line: 53, column: 21, scope: !37)
!77 = !DILocation(line: 54, column: 20, scope: !37)
!78 = !DILocation(line: 54, column: 9, scope: !37)
!79 = !DILocation(line: 55, column: 14, scope: !37)
!80 = !DILocation(line: 55, column: 9, scope: !37)
!81 = !DILocation(line: 57, column: 1, scope: !16)
!82 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_15_good", scope: !17, file: !17, line: 137, type: !18, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 139, column: 5, scope: !82)
!84 = !DILocation(line: 140, column: 5, scope: !82)
!85 = !DILocation(line: 141, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 153, type: !87, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!7, !7, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !17, line: 153, type: !7)
!93 = !DILocation(line: 153, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !17, line: 153, type: !89)
!95 = !DILocation(line: 153, column: 27, scope: !86)
!96 = !DILocation(line: 156, column: 22, scope: !86)
!97 = !DILocation(line: 156, column: 12, scope: !86)
!98 = !DILocation(line: 156, column: 5, scope: !86)
!99 = !DILocation(line: 158, column: 5, scope: !86)
!100 = !DILocation(line: 159, column: 5, scope: !86)
!101 = !DILocation(line: 160, column: 5, scope: !86)
!102 = !DILocation(line: 163, column: 5, scope: !86)
!103 = !DILocation(line: 164, column: 5, scope: !86)
!104 = !DILocation(line: 165, column: 5, scope: !86)
!105 = !DILocation(line: 167, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 64, type: !18, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !17, line: 66, type: !4)
!108 = !DILocation(line: 66, column: 15, scope: !106)
!109 = !DILocation(line: 67, column: 10, scope: !106)
!110 = !DILocation(line: 76, column: 27, scope: !106)
!111 = !DILocation(line: 76, column: 16, scope: !106)
!112 = !DILocation(line: 76, column: 14, scope: !106)
!113 = !DILocation(line: 77, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !17, line: 77, column: 13)
!115 = !DILocation(line: 77, column: 18, scope: !114)
!116 = !DILocation(line: 77, column: 13, scope: !106)
!117 = !DILocation(line: 77, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !17, line: 77, column: 27)
!119 = !DILocation(line: 78, column: 17, scope: !106)
!120 = !DILocation(line: 78, column: 9, scope: !106)
!121 = !DILocation(line: 79, column: 9, scope: !106)
!122 = !DILocation(line: 79, column: 21, scope: !106)
!123 = !DILocalVariable(name: "i", scope: !124, file: !17, line: 83, type: !38)
!124 = distinct !DILexicalBlock(scope: !106, file: !17, line: 82, column: 5)
!125 = !DILocation(line: 83, column: 16, scope: !124)
!126 = !DILocalVariable(name: "destLen", scope: !124, file: !17, line: 83, type: !38)
!127 = !DILocation(line: 83, column: 19, scope: !124)
!128 = !DILocalVariable(name: "dest", scope: !124, file: !17, line: 84, type: !44)
!129 = !DILocation(line: 84, column: 17, scope: !124)
!130 = !DILocation(line: 85, column: 17, scope: !124)
!131 = !DILocation(line: 85, column: 9, scope: !124)
!132 = !DILocation(line: 86, column: 9, scope: !124)
!133 = !DILocation(line: 86, column: 21, scope: !124)
!134 = !DILocation(line: 87, column: 26, scope: !124)
!135 = !DILocation(line: 87, column: 19, scope: !124)
!136 = !DILocation(line: 87, column: 17, scope: !124)
!137 = !DILocation(line: 90, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !124, file: !17, line: 90, column: 9)
!139 = !DILocation(line: 90, column: 14, scope: !138)
!140 = !DILocation(line: 90, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !17, line: 90, column: 9)
!142 = !DILocation(line: 90, column: 25, scope: !141)
!143 = !DILocation(line: 90, column: 23, scope: !141)
!144 = !DILocation(line: 90, column: 9, scope: !138)
!145 = !DILocation(line: 92, column: 23, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !17, line: 91, column: 9)
!147 = !DILocation(line: 92, column: 28, scope: !146)
!148 = !DILocation(line: 92, column: 18, scope: !146)
!149 = !DILocation(line: 92, column: 13, scope: !146)
!150 = !DILocation(line: 92, column: 21, scope: !146)
!151 = !DILocation(line: 93, column: 9, scope: !146)
!152 = !DILocation(line: 90, column: 35, scope: !141)
!153 = !DILocation(line: 90, column: 9, scope: !141)
!154 = distinct !{!154, !144, !155, !74}
!155 = !DILocation(line: 93, column: 9, scope: !138)
!156 = !DILocation(line: 94, column: 9, scope: !124)
!157 = !DILocation(line: 94, column: 21, scope: !124)
!158 = !DILocation(line: 95, column: 20, scope: !124)
!159 = !DILocation(line: 95, column: 9, scope: !124)
!160 = !DILocation(line: 96, column: 14, scope: !124)
!161 = !DILocation(line: 96, column: 9, scope: !124)
!162 = !DILocation(line: 98, column: 1, scope: !106)
!163 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 101, type: !18, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!164 = !DILocalVariable(name: "data", scope: !163, file: !17, line: 103, type: !4)
!165 = !DILocation(line: 103, column: 15, scope: !163)
!166 = !DILocation(line: 104, column: 10, scope: !163)
!167 = !DILocation(line: 109, column: 27, scope: !163)
!168 = !DILocation(line: 109, column: 16, scope: !163)
!169 = !DILocation(line: 109, column: 14, scope: !163)
!170 = !DILocation(line: 110, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !163, file: !17, line: 110, column: 13)
!172 = !DILocation(line: 110, column: 18, scope: !171)
!173 = !DILocation(line: 110, column: 13, scope: !163)
!174 = !DILocation(line: 110, column: 28, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !17, line: 110, column: 27)
!176 = !DILocation(line: 111, column: 17, scope: !163)
!177 = !DILocation(line: 111, column: 9, scope: !163)
!178 = !DILocation(line: 112, column: 9, scope: !163)
!179 = !DILocation(line: 112, column: 21, scope: !163)
!180 = !DILocalVariable(name: "i", scope: !181, file: !17, line: 120, type: !38)
!181 = distinct !DILexicalBlock(scope: !163, file: !17, line: 119, column: 5)
!182 = !DILocation(line: 120, column: 16, scope: !181)
!183 = !DILocalVariable(name: "destLen", scope: !181, file: !17, line: 120, type: !38)
!184 = !DILocation(line: 120, column: 19, scope: !181)
!185 = !DILocalVariable(name: "dest", scope: !181, file: !17, line: 121, type: !44)
!186 = !DILocation(line: 121, column: 17, scope: !181)
!187 = !DILocation(line: 122, column: 17, scope: !181)
!188 = !DILocation(line: 122, column: 9, scope: !181)
!189 = !DILocation(line: 123, column: 9, scope: !181)
!190 = !DILocation(line: 123, column: 21, scope: !181)
!191 = !DILocation(line: 124, column: 26, scope: !181)
!192 = !DILocation(line: 124, column: 19, scope: !181)
!193 = !DILocation(line: 124, column: 17, scope: !181)
!194 = !DILocation(line: 127, column: 16, scope: !195)
!195 = distinct !DILexicalBlock(scope: !181, file: !17, line: 127, column: 9)
!196 = !DILocation(line: 127, column: 14, scope: !195)
!197 = !DILocation(line: 127, column: 21, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !17, line: 127, column: 9)
!199 = !DILocation(line: 127, column: 25, scope: !198)
!200 = !DILocation(line: 127, column: 23, scope: !198)
!201 = !DILocation(line: 127, column: 9, scope: !195)
!202 = !DILocation(line: 129, column: 23, scope: !203)
!203 = distinct !DILexicalBlock(scope: !198, file: !17, line: 128, column: 9)
!204 = !DILocation(line: 129, column: 28, scope: !203)
!205 = !DILocation(line: 129, column: 18, scope: !203)
!206 = !DILocation(line: 129, column: 13, scope: !203)
!207 = !DILocation(line: 129, column: 21, scope: !203)
!208 = !DILocation(line: 130, column: 9, scope: !203)
!209 = !DILocation(line: 127, column: 35, scope: !198)
!210 = !DILocation(line: 127, column: 9, scope: !198)
!211 = distinct !{!211, !201, !212, !74}
!212 = !DILocation(line: 130, column: 9, scope: !195)
!213 = !DILocation(line: 131, column: 9, scope: !181)
!214 = !DILocation(line: 131, column: 21, scope: !181)
!215 = !DILocation(line: 132, column: 20, scope: !181)
!216 = !DILocation(line: 132, column: 9, scope: !181)
!217 = !DILocation(line: 133, column: 14, scope: !181)
!218 = !DILocation(line: 133, column: 9, scope: !181)
!219 = !DILocation(line: 135, column: 1, scope: !163)
