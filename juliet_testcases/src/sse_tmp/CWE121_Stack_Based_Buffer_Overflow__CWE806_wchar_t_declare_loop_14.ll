; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @globalFive, align 4, !dbg !28
  %cmp = icmp eq i32 %0, 5, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #6, !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !48, metadata !DIExpression()), !dbg !49
  %4 = load i32*, i32** %data, align 8, !dbg !50
  %call1 = call i64 @wcslen(i32* %4) #7, !dbg !51
  store i64 %call1, i64* %dataLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !56
  %6 = load i64, i64* %dataLen, align 8, !dbg !58
  %cmp2 = icmp ult i64 %5, %6, !dbg !59
  br i1 %cmp2, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !61
  %8 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !61
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !61
  %10 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !65
  store i32 %9, i32* %arrayidx4, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %11, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !73
  store i32 0, i32* %arrayidx5, align 4, !dbg !74
  %12 = load i32*, i32** %data, align 8, !dbg !75
  call void @printWLine(i32* %12), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #6, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #6, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay, i32** %data, align 8, !dbg !108
  %0 = load i32, i32* @globalFive, align 4, !dbg !109
  %cmp = icmp ne i32 %0, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !116
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !118
  %2 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !126, metadata !DIExpression()), !dbg !127
  %4 = load i32*, i32** %data, align 8, !dbg !128
  %call1 = call i64 @wcslen(i32* %4) #7, !dbg !129
  store i64 %call1, i64* %dataLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !134
  %6 = load i64, i64* %dataLen, align 8, !dbg !136
  %cmp2 = icmp ult i64 %5, %6, !dbg !137
  br i1 %cmp2, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !139
  %8 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !139
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !139
  %10 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !143
  store i32 %9, i32* %arrayidx4, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %11, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !150
  store i32 0, i32* %arrayidx5, align 4, !dbg !151
  %12 = load i32*, i32** %data, align 8, !dbg !152
  call void @printWLine(i32* %12), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !155 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !160
  store i32* %arraydecay, i32** %data, align 8, !dbg !161
  %0 = load i32, i32* @globalFive, align 4, !dbg !162
  %cmp = icmp eq i32 %0, 5, !dbg !164
  br i1 %cmp, label %if.then, label %if.end, !dbg !165

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !166
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !168
  %2 = load i32*, i32** %data, align 8, !dbg !169
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !169
  store i32 0, i32* %arrayidx, align 4, !dbg !170
  br label %if.end, !dbg !171

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !172, metadata !DIExpression()), !dbg !174
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %i, metadata !175, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !177, metadata !DIExpression()), !dbg !178
  %4 = load i32*, i32** %data, align 8, !dbg !179
  %call1 = call i64 @wcslen(i32* %4) #7, !dbg !180
  store i64 %call1, i64* %dataLen, align 8, !dbg !181
  store i64 0, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !185
  %6 = load i64, i64* %dataLen, align 8, !dbg !187
  %cmp2 = icmp ult i64 %5, %6, !dbg !188
  br i1 %cmp2, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !190
  %8 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !190
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !190
  %10 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !194
  store i32 %9, i32* %arrayidx4, align 4, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !197
  %inc = add i64 %11, 1, !dbg !197
  store i64 %inc, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !201
  store i32 0, i32* %arrayidx5, align 4, !dbg !202
  %12 = load i32*, i32** %data, align 8, !dbg !203
  call void @printWLine(i32* %12), !dbg !204
  ret void, !dbg !205
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 12, scope: !11)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocation(line: 28, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!30 = !DILocation(line: 28, column: 18, scope: !29)
!31 = !DILocation(line: 28, column: 8, scope: !11)
!32 = !DILocation(line: 31, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !12, line: 29, column: 5)
!34 = !DILocation(line: 31, column: 9, scope: !33)
!35 = !DILocation(line: 32, column: 9, scope: !33)
!36 = !DILocation(line: 32, column: 21, scope: !33)
!37 = !DILocation(line: 33, column: 5, scope: !33)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !12, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 35, column: 17, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 36, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 36, column: 16, scope: !39)
!48 = !DILocalVariable(name: "dataLen", scope: !39, file: !12, line: 36, type: !45)
!49 = !DILocation(line: 36, column: 19, scope: !39)
!50 = !DILocation(line: 37, column: 26, scope: !39)
!51 = !DILocation(line: 37, column: 19, scope: !39)
!52 = !DILocation(line: 37, column: 17, scope: !39)
!53 = !DILocation(line: 39, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !39, file: !12, line: 39, column: 9)
!55 = !DILocation(line: 39, column: 14, scope: !54)
!56 = !DILocation(line: 39, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !12, line: 39, column: 9)
!58 = !DILocation(line: 39, column: 25, scope: !57)
!59 = !DILocation(line: 39, column: 23, scope: !57)
!60 = !DILocation(line: 39, column: 9, scope: !54)
!61 = !DILocation(line: 41, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !12, line: 40, column: 9)
!63 = !DILocation(line: 41, column: 28, scope: !62)
!64 = !DILocation(line: 41, column: 18, scope: !62)
!65 = !DILocation(line: 41, column: 13, scope: !62)
!66 = !DILocation(line: 41, column: 21, scope: !62)
!67 = !DILocation(line: 42, column: 9, scope: !62)
!68 = !DILocation(line: 39, column: 35, scope: !57)
!69 = !DILocation(line: 39, column: 9, scope: !57)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 42, column: 9, scope: !54)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 43, column: 9, scope: !39)
!74 = !DILocation(line: 43, column: 20, scope: !39)
!75 = !DILocation(line: 44, column: 20, scope: !39)
!76 = !DILocation(line: 44, column: 9, scope: !39)
!77 = !DILocation(line: 46, column: 1, scope: !11)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14_good", scope: !12, file: !12, line: 109, type: !13, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 111, column: 5, scope: !78)
!80 = !DILocation(line: 112, column: 5, scope: !78)
!81 = !DILocation(line: 113, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 125, type: !83, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!19, !19, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !12, line: 125, type: !19)
!89 = !DILocation(line: 125, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !12, line: 125, type: !85)
!91 = !DILocation(line: 125, column: 27, scope: !82)
!92 = !DILocation(line: 128, column: 22, scope: !82)
!93 = !DILocation(line: 128, column: 12, scope: !82)
!94 = !DILocation(line: 128, column: 5, scope: !82)
!95 = !DILocation(line: 130, column: 5, scope: !82)
!96 = !DILocation(line: 131, column: 5, scope: !82)
!97 = !DILocation(line: 132, column: 5, scope: !82)
!98 = !DILocation(line: 135, column: 5, scope: !82)
!99 = !DILocation(line: 136, column: 5, scope: !82)
!100 = !DILocation(line: 137, column: 5, scope: !82)
!101 = !DILocation(line: 139, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 55, type: !16)
!104 = !DILocation(line: 55, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !12, line: 56, type: !22)
!106 = !DILocation(line: 56, column: 13, scope: !102)
!107 = !DILocation(line: 57, column: 12, scope: !102)
!108 = !DILocation(line: 57, column: 10, scope: !102)
!109 = !DILocation(line: 58, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !12, line: 58, column: 8)
!111 = !DILocation(line: 58, column: 18, scope: !110)
!112 = !DILocation(line: 58, column: 8, scope: !102)
!113 = !DILocation(line: 61, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 59, column: 5)
!115 = !DILocation(line: 62, column: 5, scope: !114)
!116 = !DILocation(line: 66, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !12, line: 64, column: 5)
!118 = !DILocation(line: 66, column: 9, scope: !117)
!119 = !DILocation(line: 67, column: 9, scope: !117)
!120 = !DILocation(line: 67, column: 20, scope: !117)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !12, line: 70, type: !40)
!122 = distinct !DILexicalBlock(scope: !102, file: !12, line: 69, column: 5)
!123 = !DILocation(line: 70, column: 17, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !12, line: 71, type: !45)
!125 = !DILocation(line: 71, column: 16, scope: !122)
!126 = !DILocalVariable(name: "dataLen", scope: !122, file: !12, line: 71, type: !45)
!127 = !DILocation(line: 71, column: 19, scope: !122)
!128 = !DILocation(line: 72, column: 26, scope: !122)
!129 = !DILocation(line: 72, column: 19, scope: !122)
!130 = !DILocation(line: 72, column: 17, scope: !122)
!131 = !DILocation(line: 74, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !122, file: !12, line: 74, column: 9)
!133 = !DILocation(line: 74, column: 14, scope: !132)
!134 = !DILocation(line: 74, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !12, line: 74, column: 9)
!136 = !DILocation(line: 74, column: 25, scope: !135)
!137 = !DILocation(line: 74, column: 23, scope: !135)
!138 = !DILocation(line: 74, column: 9, scope: !132)
!139 = !DILocation(line: 76, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !12, line: 75, column: 9)
!141 = !DILocation(line: 76, column: 28, scope: !140)
!142 = !DILocation(line: 76, column: 18, scope: !140)
!143 = !DILocation(line: 76, column: 13, scope: !140)
!144 = !DILocation(line: 76, column: 21, scope: !140)
!145 = !DILocation(line: 77, column: 9, scope: !140)
!146 = !DILocation(line: 74, column: 35, scope: !135)
!147 = !DILocation(line: 74, column: 9, scope: !135)
!148 = distinct !{!148, !138, !149, !72}
!149 = !DILocation(line: 77, column: 9, scope: !132)
!150 = !DILocation(line: 78, column: 9, scope: !122)
!151 = !DILocation(line: 78, column: 20, scope: !122)
!152 = !DILocation(line: 79, column: 20, scope: !122)
!153 = !DILocation(line: 79, column: 9, scope: !122)
!154 = !DILocation(line: 81, column: 1, scope: !102)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DILocalVariable(name: "data", scope: !155, file: !12, line: 86, type: !16)
!157 = !DILocation(line: 86, column: 15, scope: !155)
!158 = !DILocalVariable(name: "dataBuffer", scope: !155, file: !12, line: 87, type: !22)
!159 = !DILocation(line: 87, column: 13, scope: !155)
!160 = !DILocation(line: 88, column: 12, scope: !155)
!161 = !DILocation(line: 88, column: 10, scope: !155)
!162 = !DILocation(line: 89, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !155, file: !12, line: 89, column: 8)
!164 = !DILocation(line: 89, column: 18, scope: !163)
!165 = !DILocation(line: 89, column: 8, scope: !155)
!166 = !DILocation(line: 92, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !12, line: 90, column: 5)
!168 = !DILocation(line: 92, column: 9, scope: !167)
!169 = !DILocation(line: 93, column: 9, scope: !167)
!170 = !DILocation(line: 93, column: 20, scope: !167)
!171 = !DILocation(line: 94, column: 5, scope: !167)
!172 = !DILocalVariable(name: "dest", scope: !173, file: !12, line: 96, type: !40)
!173 = distinct !DILexicalBlock(scope: !155, file: !12, line: 95, column: 5)
!174 = !DILocation(line: 96, column: 17, scope: !173)
!175 = !DILocalVariable(name: "i", scope: !173, file: !12, line: 97, type: !45)
!176 = !DILocation(line: 97, column: 16, scope: !173)
!177 = !DILocalVariable(name: "dataLen", scope: !173, file: !12, line: 97, type: !45)
!178 = !DILocation(line: 97, column: 19, scope: !173)
!179 = !DILocation(line: 98, column: 26, scope: !173)
!180 = !DILocation(line: 98, column: 19, scope: !173)
!181 = !DILocation(line: 98, column: 17, scope: !173)
!182 = !DILocation(line: 100, column: 16, scope: !183)
!183 = distinct !DILexicalBlock(scope: !173, file: !12, line: 100, column: 9)
!184 = !DILocation(line: 100, column: 14, scope: !183)
!185 = !DILocation(line: 100, column: 21, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !12, line: 100, column: 9)
!187 = !DILocation(line: 100, column: 25, scope: !186)
!188 = !DILocation(line: 100, column: 23, scope: !186)
!189 = !DILocation(line: 100, column: 9, scope: !183)
!190 = !DILocation(line: 102, column: 23, scope: !191)
!191 = distinct !DILexicalBlock(scope: !186, file: !12, line: 101, column: 9)
!192 = !DILocation(line: 102, column: 28, scope: !191)
!193 = !DILocation(line: 102, column: 18, scope: !191)
!194 = !DILocation(line: 102, column: 13, scope: !191)
!195 = !DILocation(line: 102, column: 21, scope: !191)
!196 = !DILocation(line: 103, column: 9, scope: !191)
!197 = !DILocation(line: 100, column: 35, scope: !186)
!198 = !DILocation(line: 100, column: 9, scope: !186)
!199 = distinct !{!199, !189, !200, !72}
!200 = !DILocation(line: 103, column: 9, scope: !183)
!201 = !DILocation(line: 104, column: 9, scope: !173)
!202 = !DILocation(line: 104, column: 20, scope: !173)
!203 = !DILocation(line: 105, column: 20, scope: !173)
!204 = !DILocation(line: 105, column: 9, scope: !173)
!205 = !DILocation(line: 107, column: 1, scope: !155)
