; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_14_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32, i32* @globalFive, align 4, !dbg !27
  %cmp = icmp eq i32 %3, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !47, metadata !DIExpression()), !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !49
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !50
  store i64 %call1, i64* %dataLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !55
  %9 = load i64, i64* %dataLen, align 8, !dbg !57
  %cmp2 = icmp ult i64 %8, %9, !dbg !58
  br i1 %cmp2, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !60
  %11 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !60
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !60
  %13 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !64
  store i32 %12, i32* %arrayidx4, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %14, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !72
  store i32 0, i32* %arrayidx5, align 4, !dbg !73
  %15 = load i32*, i32** %data, align 8, !dbg !74
  call void @printWLine(i32* %15), !dbg !75
  ret void, !dbg !76
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_14_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #6, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #6, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_14_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_14_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 400, align 16, !dbg !106
  %1 = bitcast i8* %0 to i32*, !dbg !107
  store i32* %1, i32** %dataBuffer, align 8, !dbg !105
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  store i32* %2, i32** %data, align 8, !dbg !109
  %3 = load i32, i32* @globalFive, align 4, !dbg !110
  %cmp = icmp ne i32 %3, 5, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !117
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !127, metadata !DIExpression()), !dbg !128
  %7 = load i32*, i32** %data, align 8, !dbg !129
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !130
  store i64 %call1, i64* %dataLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !135
  %9 = load i64, i64* %dataLen, align 8, !dbg !137
  %cmp2 = icmp ult i64 %8, %9, !dbg !138
  br i1 %cmp2, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !140
  %11 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !140
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !140
  %13 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !144
  store i32 %12, i32* %arrayidx4, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %14, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !151
  store i32 0, i32* %arrayidx5, align 4, !dbg !152
  %15 = load i32*, i32** %data, align 8, !dbg !153
  call void @printWLine(i32* %15), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = alloca i8, i64 400, align 16, !dbg !161
  %1 = bitcast i8* %0 to i32*, !dbg !162
  store i32* %1, i32** %dataBuffer, align 8, !dbg !160
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !163
  store i32* %2, i32** %data, align 8, !dbg !164
  %3 = load i32, i32* @globalFive, align 4, !dbg !165
  %cmp = icmp eq i32 %3, 5, !dbg !167
  br i1 %cmp, label %if.then, label %if.end, !dbg !168

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !169
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !171
  %5 = load i32*, i32** %data, align 8, !dbg !172
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !172
  store i32 0, i32* %arrayidx, align 4, !dbg !173
  br label %if.end, !dbg !174

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !175, metadata !DIExpression()), !dbg !177
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !177
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %i, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !180, metadata !DIExpression()), !dbg !181
  %7 = load i32*, i32** %data, align 8, !dbg !182
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !183
  store i64 %call1, i64* %dataLen, align 8, !dbg !184
  store i64 0, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !188
  %9 = load i64, i64* %dataLen, align 8, !dbg !190
  %cmp2 = icmp ult i64 %8, %9, !dbg !191
  br i1 %cmp2, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !193
  %11 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !193
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !193
  %13 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !197
  store i32 %12, i32* %arrayidx4, align 4, !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !200
  %inc = add i64 %14, 1, !dbg !200
  store i64 %inc, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !204
  store i32 0, i32* %arrayidx5, align 4, !dbg !205
  %15 = load i32*, i32** %data, align 8, !dbg !206
  call void @printWLine(i32* %15), !dbg !207
  ret void, !dbg !208
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
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_14_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 12, scope: !15)
!26 = !DILocation(line: 27, column: 10, scope: !15)
!27 = !DILocation(line: 28, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!29 = !DILocation(line: 28, column: 18, scope: !28)
!30 = !DILocation(line: 28, column: 8, scope: !15)
!31 = !DILocation(line: 31, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !16, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 9, scope: !32)
!34 = !DILocation(line: 32, column: 9, scope: !32)
!35 = !DILocation(line: 32, column: 21, scope: !32)
!36 = !DILocation(line: 33, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !16, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 35, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !16, line: 36, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 36, column: 16, scope: !38)
!47 = !DILocalVariable(name: "dataLen", scope: !38, file: !16, line: 36, type: !44)
!48 = !DILocation(line: 36, column: 19, scope: !38)
!49 = !DILocation(line: 37, column: 26, scope: !38)
!50 = !DILocation(line: 37, column: 19, scope: !38)
!51 = !DILocation(line: 37, column: 17, scope: !38)
!52 = !DILocation(line: 39, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !38, file: !16, line: 39, column: 9)
!54 = !DILocation(line: 39, column: 14, scope: !53)
!55 = !DILocation(line: 39, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !16, line: 39, column: 9)
!57 = !DILocation(line: 39, column: 25, scope: !56)
!58 = !DILocation(line: 39, column: 23, scope: !56)
!59 = !DILocation(line: 39, column: 9, scope: !53)
!60 = !DILocation(line: 41, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !16, line: 40, column: 9)
!62 = !DILocation(line: 41, column: 28, scope: !61)
!63 = !DILocation(line: 41, column: 18, scope: !61)
!64 = !DILocation(line: 41, column: 13, scope: !61)
!65 = !DILocation(line: 41, column: 21, scope: !61)
!66 = !DILocation(line: 42, column: 9, scope: !61)
!67 = !DILocation(line: 39, column: 35, scope: !56)
!68 = !DILocation(line: 39, column: 9, scope: !56)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 42, column: 9, scope: !53)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 43, column: 9, scope: !38)
!73 = !DILocation(line: 43, column: 20, scope: !38)
!74 = !DILocation(line: 44, column: 20, scope: !38)
!75 = !DILocation(line: 44, column: 9, scope: !38)
!76 = !DILocation(line: 46, column: 1, scope: !15)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_14_good", scope: !16, file: !16, line: 109, type: !17, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 111, column: 5, scope: !77)
!79 = !DILocation(line: 112, column: 5, scope: !77)
!80 = !DILocation(line: 113, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 125, type: !82, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!7, !7, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !16, line: 125, type: !7)
!88 = !DILocation(line: 125, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !16, line: 125, type: !84)
!90 = !DILocation(line: 125, column: 27, scope: !81)
!91 = !DILocation(line: 128, column: 22, scope: !81)
!92 = !DILocation(line: 128, column: 12, scope: !81)
!93 = !DILocation(line: 128, column: 5, scope: !81)
!94 = !DILocation(line: 130, column: 5, scope: !81)
!95 = !DILocation(line: 131, column: 5, scope: !81)
!96 = !DILocation(line: 132, column: 5, scope: !81)
!97 = !DILocation(line: 135, column: 5, scope: !81)
!98 = !DILocation(line: 136, column: 5, scope: !81)
!99 = !DILocation(line: 137, column: 5, scope: !81)
!100 = !DILocation(line: 139, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !16, line: 55, type: !4)
!103 = !DILocation(line: 55, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !16, line: 56, type: !4)
!105 = !DILocation(line: 56, column: 15, scope: !101)
!106 = !DILocation(line: 56, column: 39, scope: !101)
!107 = !DILocation(line: 56, column: 28, scope: !101)
!108 = !DILocation(line: 57, column: 12, scope: !101)
!109 = !DILocation(line: 57, column: 10, scope: !101)
!110 = !DILocation(line: 58, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !101, file: !16, line: 58, column: 8)
!112 = !DILocation(line: 58, column: 18, scope: !111)
!113 = !DILocation(line: 58, column: 8, scope: !101)
!114 = !DILocation(line: 61, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !16, line: 59, column: 5)
!116 = !DILocation(line: 62, column: 5, scope: !115)
!117 = !DILocation(line: 66, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !16, line: 64, column: 5)
!119 = !DILocation(line: 66, column: 9, scope: !118)
!120 = !DILocation(line: 67, column: 9, scope: !118)
!121 = !DILocation(line: 67, column: 20, scope: !118)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !16, line: 70, type: !39)
!123 = distinct !DILexicalBlock(scope: !101, file: !16, line: 69, column: 5)
!124 = !DILocation(line: 70, column: 17, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !16, line: 71, type: !44)
!126 = !DILocation(line: 71, column: 16, scope: !123)
!127 = !DILocalVariable(name: "dataLen", scope: !123, file: !16, line: 71, type: !44)
!128 = !DILocation(line: 71, column: 19, scope: !123)
!129 = !DILocation(line: 72, column: 26, scope: !123)
!130 = !DILocation(line: 72, column: 19, scope: !123)
!131 = !DILocation(line: 72, column: 17, scope: !123)
!132 = !DILocation(line: 74, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !16, line: 74, column: 9)
!134 = !DILocation(line: 74, column: 14, scope: !133)
!135 = !DILocation(line: 74, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !16, line: 74, column: 9)
!137 = !DILocation(line: 74, column: 25, scope: !136)
!138 = !DILocation(line: 74, column: 23, scope: !136)
!139 = !DILocation(line: 74, column: 9, scope: !133)
!140 = !DILocation(line: 76, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !16, line: 75, column: 9)
!142 = !DILocation(line: 76, column: 28, scope: !141)
!143 = !DILocation(line: 76, column: 18, scope: !141)
!144 = !DILocation(line: 76, column: 13, scope: !141)
!145 = !DILocation(line: 76, column: 21, scope: !141)
!146 = !DILocation(line: 77, column: 9, scope: !141)
!147 = !DILocation(line: 74, column: 35, scope: !136)
!148 = !DILocation(line: 74, column: 9, scope: !136)
!149 = distinct !{!149, !139, !150, !71}
!150 = !DILocation(line: 77, column: 9, scope: !133)
!151 = !DILocation(line: 78, column: 9, scope: !123)
!152 = !DILocation(line: 78, column: 20, scope: !123)
!153 = !DILocation(line: 79, column: 20, scope: !123)
!154 = !DILocation(line: 79, column: 9, scope: !123)
!155 = !DILocation(line: 81, column: 1, scope: !101)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DILocalVariable(name: "data", scope: !156, file: !16, line: 86, type: !4)
!158 = !DILocation(line: 86, column: 15, scope: !156)
!159 = !DILocalVariable(name: "dataBuffer", scope: !156, file: !16, line: 87, type: !4)
!160 = !DILocation(line: 87, column: 15, scope: !156)
!161 = !DILocation(line: 87, column: 39, scope: !156)
!162 = !DILocation(line: 87, column: 28, scope: !156)
!163 = !DILocation(line: 88, column: 12, scope: !156)
!164 = !DILocation(line: 88, column: 10, scope: !156)
!165 = !DILocation(line: 89, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !156, file: !16, line: 89, column: 8)
!167 = !DILocation(line: 89, column: 18, scope: !166)
!168 = !DILocation(line: 89, column: 8, scope: !156)
!169 = !DILocation(line: 92, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !16, line: 90, column: 5)
!171 = !DILocation(line: 92, column: 9, scope: !170)
!172 = !DILocation(line: 93, column: 9, scope: !170)
!173 = !DILocation(line: 93, column: 20, scope: !170)
!174 = !DILocation(line: 94, column: 5, scope: !170)
!175 = !DILocalVariable(name: "dest", scope: !176, file: !16, line: 96, type: !39)
!176 = distinct !DILexicalBlock(scope: !156, file: !16, line: 95, column: 5)
!177 = !DILocation(line: 96, column: 17, scope: !176)
!178 = !DILocalVariable(name: "i", scope: !176, file: !16, line: 97, type: !44)
!179 = !DILocation(line: 97, column: 16, scope: !176)
!180 = !DILocalVariable(name: "dataLen", scope: !176, file: !16, line: 97, type: !44)
!181 = !DILocation(line: 97, column: 19, scope: !176)
!182 = !DILocation(line: 98, column: 26, scope: !176)
!183 = !DILocation(line: 98, column: 19, scope: !176)
!184 = !DILocation(line: 98, column: 17, scope: !176)
!185 = !DILocation(line: 100, column: 16, scope: !186)
!186 = distinct !DILexicalBlock(scope: !176, file: !16, line: 100, column: 9)
!187 = !DILocation(line: 100, column: 14, scope: !186)
!188 = !DILocation(line: 100, column: 21, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !16, line: 100, column: 9)
!190 = !DILocation(line: 100, column: 25, scope: !189)
!191 = !DILocation(line: 100, column: 23, scope: !189)
!192 = !DILocation(line: 100, column: 9, scope: !186)
!193 = !DILocation(line: 102, column: 23, scope: !194)
!194 = distinct !DILexicalBlock(scope: !189, file: !16, line: 101, column: 9)
!195 = !DILocation(line: 102, column: 28, scope: !194)
!196 = !DILocation(line: 102, column: 18, scope: !194)
!197 = !DILocation(line: 102, column: 13, scope: !194)
!198 = !DILocation(line: 102, column: 21, scope: !194)
!199 = !DILocation(line: 103, column: 9, scope: !194)
!200 = !DILocation(line: 100, column: 35, scope: !189)
!201 = !DILocation(line: 100, column: 9, scope: !189)
!202 = distinct !{!202, !192, !203, !71}
!203 = !DILocation(line: 103, column: 9, scope: !186)
!204 = !DILocation(line: 104, column: 9, scope: !176)
!205 = !DILocation(line: 104, column: 20, scope: !176)
!206 = !DILocation(line: 105, column: 20, scope: !176)
!207 = !DILocation(line: 105, column: 9, scope: !176)
!208 = !DILocation(line: 107, column: 1, scope: !156)
