; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08_bad() #0 !dbg !15 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !32
  %4 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !46, metadata !DIExpression()), !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !48
  %call2 = call i64 @wcslen(i32* %6) #7, !dbg !49
  store i64 %call2, i64* %dataLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !54
  %8 = load i64, i64* %dataLen, align 8, !dbg !56
  %cmp = icmp ult i64 %7, %8, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !59
  %10 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !59
  %11 = load i32, i32* %arrayidx3, align 4, !dbg !59
  %12 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !63
  store i32 %11, i32* %arrayidx4, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %13, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !71
  store i32 0, i32* %arrayidx5, align 4, !dbg !72
  %14 = load i32*, i32** %data, align 8, !dbg !73
  call void @printWLine(i32* %14), !dbg !74
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08_good() #0 !dbg !76 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !100 {
entry:
  ret i32 1, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBuffer, align 8, !dbg !108
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  store i32* %2, i32** %data, align 8, !dbg !112
  %call = call i32 @staticReturnsFalse(), !dbg !113
  %tobool = icmp ne i32 %call, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !119
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !121
  %4 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !129, metadata !DIExpression()), !dbg !130
  %6 = load i32*, i32** %data, align 8, !dbg !131
  %call2 = call i64 @wcslen(i32* %6) #7, !dbg !132
  store i64 %call2, i64* %dataLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !137
  %8 = load i64, i64* %dataLen, align 8, !dbg !139
  %cmp = icmp ult i64 %7, %8, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !142
  %10 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !142
  %11 = load i32, i32* %arrayidx3, align 4, !dbg !142
  %12 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !146
  store i32 %11, i32* %arrayidx4, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %13, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !153
  store i32 0, i32* %arrayidx5, align 4, !dbg !154
  %14 = load i32*, i32** %data, align 8, !dbg !155
  call void @printWLine(i32* %14), !dbg !156
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !158 {
entry:
  ret i32 0, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !160 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !163, metadata !DIExpression()), !dbg !164
  %0 = alloca i8, i64 400, align 16, !dbg !165
  %1 = bitcast i8* %0 to i32*, !dbg !166
  store i32* %1, i32** %dataBuffer, align 8, !dbg !164
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !167
  store i32* %2, i32** %data, align 8, !dbg !168
  %call = call i32 @staticReturnsTrue(), !dbg !169
  %tobool = icmp ne i32 %call, 0, !dbg !169
  br i1 %tobool, label %if.then, label %if.end, !dbg !171

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !172
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !174
  %4 = load i32*, i32** %data, align 8, !dbg !175
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !175
  store i32 0, i32* %arrayidx, align 4, !dbg !176
  br label %if.end, !dbg !177

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !178, metadata !DIExpression()), !dbg !180
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !180
  call void @llvm.dbg.declare(metadata i64* %i, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !183, metadata !DIExpression()), !dbg !184
  %6 = load i32*, i32** %data, align 8, !dbg !185
  %call2 = call i64 @wcslen(i32* %6) #7, !dbg !186
  store i64 %call2, i64* %dataLen, align 8, !dbg !187
  store i64 0, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !190

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !191
  %8 = load i64, i64* %dataLen, align 8, !dbg !193
  %cmp = icmp ult i64 %7, %8, !dbg !194
  br i1 %cmp, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !196
  %10 = load i64, i64* %i, align 8, !dbg !198
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !196
  %11 = load i32, i32* %arrayidx3, align 4, !dbg !196
  %12 = load i64, i64* %i, align 8, !dbg !199
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !200
  store i32 %11, i32* %arrayidx4, align 4, !dbg !201
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !203
  %inc = add i64 %13, 1, !dbg !203
  store i64 %inc, i64* %i, align 8, !dbg !203
  br label %for.cond, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !207
  store i32 0, i32* %arrayidx5, align 4, !dbg !208
  %14 = load i32*, i32** %data, align 8, !dbg !209
  call void @printWLine(i32* %14), !dbg !210
  ret void, !dbg !211
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 40, type: !4)
!22 = !DILocation(line: 40, column: 15, scope: !15)
!23 = !DILocation(line: 40, column: 39, scope: !15)
!24 = !DILocation(line: 40, column: 28, scope: !15)
!25 = !DILocation(line: 41, column: 12, scope: !15)
!26 = !DILocation(line: 41, column: 10, scope: !15)
!27 = !DILocation(line: 42, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 8)
!29 = !DILocation(line: 42, column: 8, scope: !15)
!30 = !DILocation(line: 45, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !16, line: 43, column: 5)
!32 = !DILocation(line: 45, column: 9, scope: !31)
!33 = !DILocation(line: 46, column: 9, scope: !31)
!34 = !DILocation(line: 46, column: 21, scope: !31)
!35 = !DILocation(line: 47, column: 5, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !16, line: 49, type: !38)
!37 = distinct !DILexicalBlock(scope: !15, file: !16, line: 48, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 49, column: 17, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !37, file: !16, line: 50, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 50, column: 16, scope: !37)
!46 = !DILocalVariable(name: "dataLen", scope: !37, file: !16, line: 50, type: !43)
!47 = !DILocation(line: 50, column: 19, scope: !37)
!48 = !DILocation(line: 51, column: 26, scope: !37)
!49 = !DILocation(line: 51, column: 19, scope: !37)
!50 = !DILocation(line: 51, column: 17, scope: !37)
!51 = !DILocation(line: 53, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !37, file: !16, line: 53, column: 9)
!53 = !DILocation(line: 53, column: 14, scope: !52)
!54 = !DILocation(line: 53, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !16, line: 53, column: 9)
!56 = !DILocation(line: 53, column: 25, scope: !55)
!57 = !DILocation(line: 53, column: 23, scope: !55)
!58 = !DILocation(line: 53, column: 9, scope: !52)
!59 = !DILocation(line: 55, column: 23, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !16, line: 54, column: 9)
!61 = !DILocation(line: 55, column: 28, scope: !60)
!62 = !DILocation(line: 55, column: 18, scope: !60)
!63 = !DILocation(line: 55, column: 13, scope: !60)
!64 = !DILocation(line: 55, column: 21, scope: !60)
!65 = !DILocation(line: 56, column: 9, scope: !60)
!66 = !DILocation(line: 53, column: 35, scope: !55)
!67 = !DILocation(line: 53, column: 9, scope: !55)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 56, column: 9, scope: !52)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 57, column: 9, scope: !37)
!72 = !DILocation(line: 57, column: 20, scope: !37)
!73 = !DILocation(line: 58, column: 20, scope: !37)
!74 = !DILocation(line: 58, column: 9, scope: !37)
!75 = !DILocation(line: 60, column: 1, scope: !15)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08_good", scope: !16, file: !16, line: 123, type: !17, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 125, column: 5, scope: !76)
!78 = !DILocation(line: 126, column: 5, scope: !76)
!79 = !DILocation(line: 127, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 139, type: !81, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!7, !7, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !16, line: 139, type: !7)
!87 = !DILocation(line: 139, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !16, line: 139, type: !83)
!89 = !DILocation(line: 139, column: 27, scope: !80)
!90 = !DILocation(line: 142, column: 22, scope: !80)
!91 = !DILocation(line: 142, column: 12, scope: !80)
!92 = !DILocation(line: 142, column: 5, scope: !80)
!93 = !DILocation(line: 144, column: 5, scope: !80)
!94 = !DILocation(line: 145, column: 5, scope: !80)
!95 = !DILocation(line: 146, column: 5, scope: !80)
!96 = !DILocation(line: 149, column: 5, scope: !80)
!97 = !DILocation(line: 150, column: 5, scope: !80)
!98 = !DILocation(line: 151, column: 5, scope: !80)
!99 = !DILocation(line: 153, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 25, type: !101, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!7}
!103 = !DILocation(line: 27, column: 5, scope: !100)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 67, type: !17, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !16, line: 69, type: !4)
!106 = !DILocation(line: 69, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !16, line: 70, type: !4)
!108 = !DILocation(line: 70, column: 15, scope: !104)
!109 = !DILocation(line: 70, column: 39, scope: !104)
!110 = !DILocation(line: 70, column: 28, scope: !104)
!111 = !DILocation(line: 71, column: 12, scope: !104)
!112 = !DILocation(line: 71, column: 10, scope: !104)
!113 = !DILocation(line: 72, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !16, line: 72, column: 8)
!115 = !DILocation(line: 72, column: 8, scope: !104)
!116 = !DILocation(line: 75, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !16, line: 73, column: 5)
!118 = !DILocation(line: 76, column: 5, scope: !117)
!119 = !DILocation(line: 80, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !114, file: !16, line: 78, column: 5)
!121 = !DILocation(line: 80, column: 9, scope: !120)
!122 = !DILocation(line: 81, column: 9, scope: !120)
!123 = !DILocation(line: 81, column: 20, scope: !120)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !16, line: 84, type: !38)
!125 = distinct !DILexicalBlock(scope: !104, file: !16, line: 83, column: 5)
!126 = !DILocation(line: 84, column: 17, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !125, file: !16, line: 85, type: !43)
!128 = !DILocation(line: 85, column: 16, scope: !125)
!129 = !DILocalVariable(name: "dataLen", scope: !125, file: !16, line: 85, type: !43)
!130 = !DILocation(line: 85, column: 19, scope: !125)
!131 = !DILocation(line: 86, column: 26, scope: !125)
!132 = !DILocation(line: 86, column: 19, scope: !125)
!133 = !DILocation(line: 86, column: 17, scope: !125)
!134 = !DILocation(line: 88, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !16, line: 88, column: 9)
!136 = !DILocation(line: 88, column: 14, scope: !135)
!137 = !DILocation(line: 88, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !16, line: 88, column: 9)
!139 = !DILocation(line: 88, column: 25, scope: !138)
!140 = !DILocation(line: 88, column: 23, scope: !138)
!141 = !DILocation(line: 88, column: 9, scope: !135)
!142 = !DILocation(line: 90, column: 23, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !16, line: 89, column: 9)
!144 = !DILocation(line: 90, column: 28, scope: !143)
!145 = !DILocation(line: 90, column: 18, scope: !143)
!146 = !DILocation(line: 90, column: 13, scope: !143)
!147 = !DILocation(line: 90, column: 21, scope: !143)
!148 = !DILocation(line: 91, column: 9, scope: !143)
!149 = !DILocation(line: 88, column: 35, scope: !138)
!150 = !DILocation(line: 88, column: 9, scope: !138)
!151 = distinct !{!151, !141, !152, !70}
!152 = !DILocation(line: 91, column: 9, scope: !135)
!153 = !DILocation(line: 92, column: 9, scope: !125)
!154 = !DILocation(line: 92, column: 20, scope: !125)
!155 = !DILocation(line: 93, column: 20, scope: !125)
!156 = !DILocation(line: 93, column: 9, scope: !125)
!157 = !DILocation(line: 95, column: 1, scope: !104)
!158 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 30, type: !101, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!159 = !DILocation(line: 32, column: 5, scope: !158)
!160 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 98, type: !17, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!161 = !DILocalVariable(name: "data", scope: !160, file: !16, line: 100, type: !4)
!162 = !DILocation(line: 100, column: 15, scope: !160)
!163 = !DILocalVariable(name: "dataBuffer", scope: !160, file: !16, line: 101, type: !4)
!164 = !DILocation(line: 101, column: 15, scope: !160)
!165 = !DILocation(line: 101, column: 39, scope: !160)
!166 = !DILocation(line: 101, column: 28, scope: !160)
!167 = !DILocation(line: 102, column: 12, scope: !160)
!168 = !DILocation(line: 102, column: 10, scope: !160)
!169 = !DILocation(line: 103, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !160, file: !16, line: 103, column: 8)
!171 = !DILocation(line: 103, column: 8, scope: !160)
!172 = !DILocation(line: 106, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !16, line: 104, column: 5)
!174 = !DILocation(line: 106, column: 9, scope: !173)
!175 = !DILocation(line: 107, column: 9, scope: !173)
!176 = !DILocation(line: 107, column: 20, scope: !173)
!177 = !DILocation(line: 108, column: 5, scope: !173)
!178 = !DILocalVariable(name: "dest", scope: !179, file: !16, line: 110, type: !38)
!179 = distinct !DILexicalBlock(scope: !160, file: !16, line: 109, column: 5)
!180 = !DILocation(line: 110, column: 17, scope: !179)
!181 = !DILocalVariable(name: "i", scope: !179, file: !16, line: 111, type: !43)
!182 = !DILocation(line: 111, column: 16, scope: !179)
!183 = !DILocalVariable(name: "dataLen", scope: !179, file: !16, line: 111, type: !43)
!184 = !DILocation(line: 111, column: 19, scope: !179)
!185 = !DILocation(line: 112, column: 26, scope: !179)
!186 = !DILocation(line: 112, column: 19, scope: !179)
!187 = !DILocation(line: 112, column: 17, scope: !179)
!188 = !DILocation(line: 114, column: 16, scope: !189)
!189 = distinct !DILexicalBlock(scope: !179, file: !16, line: 114, column: 9)
!190 = !DILocation(line: 114, column: 14, scope: !189)
!191 = !DILocation(line: 114, column: 21, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !16, line: 114, column: 9)
!193 = !DILocation(line: 114, column: 25, scope: !192)
!194 = !DILocation(line: 114, column: 23, scope: !192)
!195 = !DILocation(line: 114, column: 9, scope: !189)
!196 = !DILocation(line: 116, column: 23, scope: !197)
!197 = distinct !DILexicalBlock(scope: !192, file: !16, line: 115, column: 9)
!198 = !DILocation(line: 116, column: 28, scope: !197)
!199 = !DILocation(line: 116, column: 18, scope: !197)
!200 = !DILocation(line: 116, column: 13, scope: !197)
!201 = !DILocation(line: 116, column: 21, scope: !197)
!202 = !DILocation(line: 117, column: 9, scope: !197)
!203 = !DILocation(line: 114, column: 35, scope: !192)
!204 = !DILocation(line: 114, column: 9, scope: !192)
!205 = distinct !{!205, !195, !206, !70}
!206 = !DILocation(line: 117, column: 9, scope: !189)
!207 = !DILocation(line: 118, column: 9, scope: !179)
!208 = !DILocation(line: 118, column: 20, scope: !179)
!209 = !DILocation(line: 119, column: 20, scope: !179)
!210 = !DILocation(line: 119, column: 9, scope: !179)
!211 = !DILocation(line: 121, column: 1, scope: !160)
