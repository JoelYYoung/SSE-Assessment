; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_10_bad() #0 !dbg !15 {
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
  %3 = load i32, i32* @globalTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %3, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !46, metadata !DIExpression()), !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !48
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !49
  store i64 %call1, i64* %dataLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !54
  %9 = load i64, i64* %dataLen, align 8, !dbg !56
  %cmp = icmp ult i64 %8, %9, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !59
  %11 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !59
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !59
  %13 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !63
  store i32 %12, i32* %arrayidx3, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %14, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !71
  store i32 0, i32* %arrayidx4, align 4, !dbg !72
  %15 = load i32*, i32** %data, align 8, !dbg !73
  call void @printWLine(i32* %15), !dbg !74
  ret void, !dbg !75
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_10_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #6, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #6, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_10_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_10_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 400, align 16, !dbg !105
  %1 = bitcast i8* %0 to i32*, !dbg !106
  store i32* %1, i32** %dataBuffer, align 8, !dbg !104
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  store i32* %2, i32** %data, align 8, !dbg !108
  %3 = load i32, i32* @globalFalse, align 4, !dbg !109
  %tobool = icmp ne i32 %3, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !115
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !117
  %5 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !125, metadata !DIExpression()), !dbg !126
  %7 = load i32*, i32** %data, align 8, !dbg !127
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !128
  store i64 %call1, i64* %dataLen, align 8, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !133
  %9 = load i64, i64* %dataLen, align 8, !dbg !135
  %cmp = icmp ult i64 %8, %9, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !138
  %11 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !138
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !138
  %13 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !142
  store i32 %12, i32* %arrayidx3, align 4, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %14, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !149
  store i32 0, i32* %arrayidx4, align 4, !dbg !150
  %15 = load i32*, i32** %data, align 8, !dbg !151
  call void @printWLine(i32* %15), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !154 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  %0 = alloca i8, i64 400, align 16, !dbg !159
  %1 = bitcast i8* %0 to i32*, !dbg !160
  store i32* %1, i32** %dataBuffer, align 8, !dbg !158
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !161
  store i32* %2, i32** %data, align 8, !dbg !162
  %3 = load i32, i32* @globalTrue, align 4, !dbg !163
  %tobool = icmp ne i32 %3, 0, !dbg !163
  br i1 %tobool, label %if.then, label %if.end, !dbg !165

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !166
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !168
  %5 = load i32*, i32** %data, align 8, !dbg !169
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !169
  store i32 0, i32* %arrayidx, align 4, !dbg !170
  br label %if.end, !dbg !171

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !172, metadata !DIExpression()), !dbg !174
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %i, metadata !175, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !177, metadata !DIExpression()), !dbg !178
  %7 = load i32*, i32** %data, align 8, !dbg !179
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !180
  store i64 %call1, i64* %dataLen, align 8, !dbg !181
  store i64 0, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !185
  %9 = load i64, i64* %dataLen, align 8, !dbg !187
  %cmp = icmp ult i64 %8, %9, !dbg !188
  br i1 %cmp, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !190
  %11 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !190
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !190
  %13 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !194
  store i32 %12, i32* %arrayidx3, align 4, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !197
  %inc = add i64 %14, 1, !dbg !197
  store i64 %inc, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !201
  store i32 0, i32* %arrayidx4, align 4, !dbg !202
  %15 = load i32*, i32** %data, align 8, !dbg !203
  call void @printWLine(i32* %15), !dbg !204
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
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_10_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_10.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 28, column: 8, scope: !15)
!30 = !DILocation(line: 31, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !16, line: 29, column: 5)
!32 = !DILocation(line: 31, column: 9, scope: !31)
!33 = !DILocation(line: 32, column: 9, scope: !31)
!34 = !DILocation(line: 32, column: 21, scope: !31)
!35 = !DILocation(line: 33, column: 5, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !16, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 35, column: 17, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !37, file: !16, line: 36, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 36, column: 16, scope: !37)
!46 = !DILocalVariable(name: "dataLen", scope: !37, file: !16, line: 36, type: !43)
!47 = !DILocation(line: 36, column: 19, scope: !37)
!48 = !DILocation(line: 37, column: 26, scope: !37)
!49 = !DILocation(line: 37, column: 19, scope: !37)
!50 = !DILocation(line: 37, column: 17, scope: !37)
!51 = !DILocation(line: 39, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !37, file: !16, line: 39, column: 9)
!53 = !DILocation(line: 39, column: 14, scope: !52)
!54 = !DILocation(line: 39, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !16, line: 39, column: 9)
!56 = !DILocation(line: 39, column: 25, scope: !55)
!57 = !DILocation(line: 39, column: 23, scope: !55)
!58 = !DILocation(line: 39, column: 9, scope: !52)
!59 = !DILocation(line: 41, column: 23, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !16, line: 40, column: 9)
!61 = !DILocation(line: 41, column: 28, scope: !60)
!62 = !DILocation(line: 41, column: 18, scope: !60)
!63 = !DILocation(line: 41, column: 13, scope: !60)
!64 = !DILocation(line: 41, column: 21, scope: !60)
!65 = !DILocation(line: 42, column: 9, scope: !60)
!66 = !DILocation(line: 39, column: 35, scope: !55)
!67 = !DILocation(line: 39, column: 9, scope: !55)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 42, column: 9, scope: !52)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 43, column: 9, scope: !37)
!72 = !DILocation(line: 43, column: 20, scope: !37)
!73 = !DILocation(line: 44, column: 20, scope: !37)
!74 = !DILocation(line: 44, column: 9, scope: !37)
!75 = !DILocation(line: 46, column: 1, scope: !15)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_10_good", scope: !16, file: !16, line: 109, type: !17, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 111, column: 5, scope: !76)
!78 = !DILocation(line: 112, column: 5, scope: !76)
!79 = !DILocation(line: 113, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 125, type: !81, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!7, !7, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !16, line: 125, type: !7)
!87 = !DILocation(line: 125, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !16, line: 125, type: !83)
!89 = !DILocation(line: 125, column: 27, scope: !80)
!90 = !DILocation(line: 128, column: 22, scope: !80)
!91 = !DILocation(line: 128, column: 12, scope: !80)
!92 = !DILocation(line: 128, column: 5, scope: !80)
!93 = !DILocation(line: 130, column: 5, scope: !80)
!94 = !DILocation(line: 131, column: 5, scope: !80)
!95 = !DILocation(line: 132, column: 5, scope: !80)
!96 = !DILocation(line: 135, column: 5, scope: !80)
!97 = !DILocation(line: 136, column: 5, scope: !80)
!98 = !DILocation(line: 137, column: 5, scope: !80)
!99 = !DILocation(line: 139, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !16, line: 55, type: !4)
!102 = !DILocation(line: 55, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !16, line: 56, type: !4)
!104 = !DILocation(line: 56, column: 15, scope: !100)
!105 = !DILocation(line: 56, column: 39, scope: !100)
!106 = !DILocation(line: 56, column: 28, scope: !100)
!107 = !DILocation(line: 57, column: 12, scope: !100)
!108 = !DILocation(line: 57, column: 10, scope: !100)
!109 = !DILocation(line: 58, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !100, file: !16, line: 58, column: 8)
!111 = !DILocation(line: 58, column: 8, scope: !100)
!112 = !DILocation(line: 61, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !16, line: 59, column: 5)
!114 = !DILocation(line: 62, column: 5, scope: !113)
!115 = !DILocation(line: 66, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !16, line: 64, column: 5)
!117 = !DILocation(line: 66, column: 9, scope: !116)
!118 = !DILocation(line: 67, column: 9, scope: !116)
!119 = !DILocation(line: 67, column: 20, scope: !116)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !16, line: 70, type: !38)
!121 = distinct !DILexicalBlock(scope: !100, file: !16, line: 69, column: 5)
!122 = !DILocation(line: 70, column: 17, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !121, file: !16, line: 71, type: !43)
!124 = !DILocation(line: 71, column: 16, scope: !121)
!125 = !DILocalVariable(name: "dataLen", scope: !121, file: !16, line: 71, type: !43)
!126 = !DILocation(line: 71, column: 19, scope: !121)
!127 = !DILocation(line: 72, column: 26, scope: !121)
!128 = !DILocation(line: 72, column: 19, scope: !121)
!129 = !DILocation(line: 72, column: 17, scope: !121)
!130 = !DILocation(line: 74, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !121, file: !16, line: 74, column: 9)
!132 = !DILocation(line: 74, column: 14, scope: !131)
!133 = !DILocation(line: 74, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !16, line: 74, column: 9)
!135 = !DILocation(line: 74, column: 25, scope: !134)
!136 = !DILocation(line: 74, column: 23, scope: !134)
!137 = !DILocation(line: 74, column: 9, scope: !131)
!138 = !DILocation(line: 76, column: 23, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !16, line: 75, column: 9)
!140 = !DILocation(line: 76, column: 28, scope: !139)
!141 = !DILocation(line: 76, column: 18, scope: !139)
!142 = !DILocation(line: 76, column: 13, scope: !139)
!143 = !DILocation(line: 76, column: 21, scope: !139)
!144 = !DILocation(line: 77, column: 9, scope: !139)
!145 = !DILocation(line: 74, column: 35, scope: !134)
!146 = !DILocation(line: 74, column: 9, scope: !134)
!147 = distinct !{!147, !137, !148, !70}
!148 = !DILocation(line: 77, column: 9, scope: !131)
!149 = !DILocation(line: 78, column: 9, scope: !121)
!150 = !DILocation(line: 78, column: 20, scope: !121)
!151 = !DILocation(line: 79, column: 20, scope: !121)
!152 = !DILocation(line: 79, column: 9, scope: !121)
!153 = !DILocation(line: 81, column: 1, scope: !100)
!154 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!155 = !DILocalVariable(name: "data", scope: !154, file: !16, line: 86, type: !4)
!156 = !DILocation(line: 86, column: 15, scope: !154)
!157 = !DILocalVariable(name: "dataBuffer", scope: !154, file: !16, line: 87, type: !4)
!158 = !DILocation(line: 87, column: 15, scope: !154)
!159 = !DILocation(line: 87, column: 39, scope: !154)
!160 = !DILocation(line: 87, column: 28, scope: !154)
!161 = !DILocation(line: 88, column: 12, scope: !154)
!162 = !DILocation(line: 88, column: 10, scope: !154)
!163 = !DILocation(line: 89, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !154, file: !16, line: 89, column: 8)
!165 = !DILocation(line: 89, column: 8, scope: !154)
!166 = !DILocation(line: 92, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !16, line: 90, column: 5)
!168 = !DILocation(line: 92, column: 9, scope: !167)
!169 = !DILocation(line: 93, column: 9, scope: !167)
!170 = !DILocation(line: 93, column: 20, scope: !167)
!171 = !DILocation(line: 94, column: 5, scope: !167)
!172 = !DILocalVariable(name: "dest", scope: !173, file: !16, line: 96, type: !38)
!173 = distinct !DILexicalBlock(scope: !154, file: !16, line: 95, column: 5)
!174 = !DILocation(line: 96, column: 17, scope: !173)
!175 = !DILocalVariable(name: "i", scope: !173, file: !16, line: 97, type: !43)
!176 = !DILocation(line: 97, column: 16, scope: !173)
!177 = !DILocalVariable(name: "dataLen", scope: !173, file: !16, line: 97, type: !43)
!178 = !DILocation(line: 97, column: 19, scope: !173)
!179 = !DILocation(line: 98, column: 26, scope: !173)
!180 = !DILocation(line: 98, column: 19, scope: !173)
!181 = !DILocation(line: 98, column: 17, scope: !173)
!182 = !DILocation(line: 100, column: 16, scope: !183)
!183 = distinct !DILexicalBlock(scope: !173, file: !16, line: 100, column: 9)
!184 = !DILocation(line: 100, column: 14, scope: !183)
!185 = !DILocation(line: 100, column: 21, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !16, line: 100, column: 9)
!187 = !DILocation(line: 100, column: 25, scope: !186)
!188 = !DILocation(line: 100, column: 23, scope: !186)
!189 = !DILocation(line: 100, column: 9, scope: !183)
!190 = !DILocation(line: 102, column: 23, scope: !191)
!191 = distinct !DILexicalBlock(scope: !186, file: !16, line: 101, column: 9)
!192 = !DILocation(line: 102, column: 28, scope: !191)
!193 = !DILocation(line: 102, column: 18, scope: !191)
!194 = !DILocation(line: 102, column: 13, scope: !191)
!195 = !DILocation(line: 102, column: 21, scope: !191)
!196 = !DILocation(line: 103, column: 9, scope: !191)
!197 = !DILocation(line: 100, column: 35, scope: !186)
!198 = !DILocation(line: 100, column: 9, scope: !186)
!199 = distinct !{!199, !189, !200, !70}
!200 = !DILocation(line: 103, column: 9, scope: !183)
!201 = !DILocation(line: 104, column: 9, scope: !173)
!202 = !DILocation(line: 104, column: 20, scope: !173)
!203 = !DILocation(line: 105, column: 20, scope: !173)
!204 = !DILocation(line: 105, column: 9, scope: !173)
!205 = !DILocation(line: 107, column: 1, scope: !154)
