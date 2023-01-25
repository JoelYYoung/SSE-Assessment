; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_08_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_08_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_08_bad.source to i8*), i64 44, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %call1 = call i64 @wcslen(i32* %arraydecay) #6, !dbg !51
  store i64 %call1, i64* %sourceLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !56
  %8 = load i64, i64* %sourceLen, align 8, !dbg !58
  %add = add i64 %8, 1, !dbg !59
  %cmp = icmp ult i64 %7, %add, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !64
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !64
  %11 = load i32*, i32** %data, align 8, !dbg !65
  %12 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !65
  store i32 %10, i32* %arrayidx3, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %13, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !74
  call void @printWLine(i32* %14), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_08_good() #0 !dbg !77 {
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
  %call = call i64 @time(i64* null) #7, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #7, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_08_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_08_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !101 {
entry:
  ret i32 1, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 40, align 16, !dbg !110
  %1 = bitcast i8* %0 to i32*, !dbg !111
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = alloca i8, i64 44, align 16, !dbg !114
  %3 = bitcast i8* %2 to i32*, !dbg !115
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !113
  %call = call i32 @staticReturnsFalse(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !119
  br label %if.end, !dbg !121

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !122
  store i32* %4, i32** %data, align 8, !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !129
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !134
  %call1 = call i64 @wcslen(i32* %arraydecay) #6, !dbg !135
  store i64 %call1, i64* %sourceLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !140
  %8 = load i64, i64* %sourceLen, align 8, !dbg !142
  %add = add i64 %8, 1, !dbg !143
  %cmp = icmp ult i64 %7, %add, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !148
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !148
  %11 = load i32*, i32** %data, align 8, !dbg !149
  %12 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !149
  store i32 %10, i32* %arrayidx3, align 4, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %13, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !157
  call void @printWLine(i32* %14), !dbg !158
  ret void, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !160 {
entry:
  ret i32 0, !dbg !161
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !162 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !163, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !165, metadata !DIExpression()), !dbg !166
  %0 = alloca i8, i64 40, align 16, !dbg !167
  %1 = bitcast i8* %0 to i32*, !dbg !168
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !166
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !169, metadata !DIExpression()), !dbg !170
  %2 = alloca i8, i64 44, align 16, !dbg !171
  %3 = bitcast i8* %2 to i32*, !dbg !172
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !170
  %call = call i32 @staticReturnsTrue(), !dbg !173
  %tobool = icmp ne i32 %call, 0, !dbg !173
  br i1 %tobool, label %if.then, label %if.end, !dbg !175

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !176
  store i32* %4, i32** %data, align 8, !dbg !178
  %5 = load i32*, i32** %data, align 8, !dbg !179
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !179
  store i32 0, i32* %arrayidx, align 4, !dbg !180
  br label %if.end, !dbg !181

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !182, metadata !DIExpression()), !dbg !184
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !184
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !184
  call void @llvm.dbg.declare(metadata i64* %i, metadata !185, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !187, metadata !DIExpression()), !dbg !188
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !189
  %call1 = call i64 @wcslen(i32* %arraydecay) #6, !dbg !190
  store i64 %call1, i64* %sourceLen, align 8, !dbg !191
  store i64 0, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !195
  %8 = load i64, i64* %sourceLen, align 8, !dbg !197
  %add = add i64 %8, 1, !dbg !198
  %cmp = icmp ult i64 %7, %add, !dbg !199
  br i1 %cmp, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !203
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !203
  %11 = load i32*, i32** %data, align 8, !dbg !204
  %12 = load i64, i64* %i, align 8, !dbg !205
  %arrayidx3 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !204
  store i32 %10, i32* %arrayidx3, align 4, !dbg !206
  br label %for.inc, !dbg !207

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !208
  %inc = add i64 %13, 1, !dbg !208
  store i64 %inc, i64* %i, align 8, !dbg !208
  br label %for.cond, !dbg !209, !llvm.loop !210

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !212
  call void @printWLine(i32* %14), !dbg !213
  ret void, !dbg !214
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_08_bad", scope: !16, file: !16, line: 42, type: !17, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 44, type: !4)
!20 = !DILocation(line: 44, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 45, type: !4)
!22 = !DILocation(line: 45, column: 15, scope: !15)
!23 = !DILocation(line: 45, column: 42, scope: !15)
!24 = !DILocation(line: 45, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 46, type: !4)
!26 = !DILocation(line: 46, column: 15, scope: !15)
!27 = !DILocation(line: 46, column: 43, scope: !15)
!28 = !DILocation(line: 46, column: 32, scope: !15)
!29 = !DILocation(line: 47, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 47, column: 8)
!31 = !DILocation(line: 47, column: 8, scope: !15)
!32 = !DILocation(line: 51, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 48, column: 5)
!34 = !DILocation(line: 51, column: 14, scope: !33)
!35 = !DILocation(line: 52, column: 9, scope: !33)
!36 = !DILocation(line: 52, column: 17, scope: !33)
!37 = !DILocation(line: 53, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 55, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 54, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 11)
!43 = !DILocation(line: 55, column: 17, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !16, line: 56, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 56, column: 16, scope: !39)
!48 = !DILocalVariable(name: "sourceLen", scope: !39, file: !16, line: 56, type: !45)
!49 = !DILocation(line: 56, column: 19, scope: !39)
!50 = !DILocation(line: 57, column: 28, scope: !39)
!51 = !DILocation(line: 57, column: 21, scope: !39)
!52 = !DILocation(line: 57, column: 19, scope: !39)
!53 = !DILocation(line: 60, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !39, file: !16, line: 60, column: 9)
!55 = !DILocation(line: 60, column: 14, scope: !54)
!56 = !DILocation(line: 60, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !16, line: 60, column: 9)
!58 = !DILocation(line: 60, column: 25, scope: !57)
!59 = !DILocation(line: 60, column: 35, scope: !57)
!60 = !DILocation(line: 60, column: 23, scope: !57)
!61 = !DILocation(line: 60, column: 9, scope: !54)
!62 = !DILocation(line: 62, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !16, line: 61, column: 9)
!64 = !DILocation(line: 62, column: 23, scope: !63)
!65 = !DILocation(line: 62, column: 13, scope: !63)
!66 = !DILocation(line: 62, column: 18, scope: !63)
!67 = !DILocation(line: 62, column: 21, scope: !63)
!68 = !DILocation(line: 63, column: 9, scope: !63)
!69 = !DILocation(line: 60, column: 41, scope: !57)
!70 = !DILocation(line: 60, column: 9, scope: !57)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 63, column: 9, scope: !54)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 64, column: 20, scope: !39)
!75 = !DILocation(line: 64, column: 9, scope: !39)
!76 = !DILocation(line: 66, column: 1, scope: !15)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_08_good", scope: !16, file: !16, line: 131, type: !17, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 133, column: 5, scope: !77)
!79 = !DILocation(line: 134, column: 5, scope: !77)
!80 = !DILocation(line: 135, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 147, type: !82, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!7, !7, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !16, line: 147, type: !7)
!88 = !DILocation(line: 147, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !16, line: 147, type: !84)
!90 = !DILocation(line: 147, column: 27, scope: !81)
!91 = !DILocation(line: 150, column: 22, scope: !81)
!92 = !DILocation(line: 150, column: 12, scope: !81)
!93 = !DILocation(line: 150, column: 5, scope: !81)
!94 = !DILocation(line: 152, column: 5, scope: !81)
!95 = !DILocation(line: 153, column: 5, scope: !81)
!96 = !DILocation(line: 154, column: 5, scope: !81)
!97 = !DILocation(line: 157, column: 5, scope: !81)
!98 = !DILocation(line: 158, column: 5, scope: !81)
!99 = !DILocation(line: 159, column: 5, scope: !81)
!100 = !DILocation(line: 161, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 30, type: !102, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!7}
!104 = !DILocation(line: 32, column: 5, scope: !101)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 73, type: !17, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !16, line: 75, type: !4)
!107 = !DILocation(line: 75, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !16, line: 76, type: !4)
!109 = !DILocation(line: 76, column: 15, scope: !105)
!110 = !DILocation(line: 76, column: 42, scope: !105)
!111 = !DILocation(line: 76, column: 31, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !16, line: 77, type: !4)
!113 = !DILocation(line: 77, column: 15, scope: !105)
!114 = !DILocation(line: 77, column: 43, scope: !105)
!115 = !DILocation(line: 77, column: 32, scope: !105)
!116 = !DILocation(line: 78, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !105, file: !16, line: 78, column: 8)
!118 = !DILocation(line: 78, column: 8, scope: !105)
!119 = !DILocation(line: 81, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !16, line: 79, column: 5)
!121 = !DILocation(line: 82, column: 5, scope: !120)
!122 = !DILocation(line: 87, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !16, line: 84, column: 5)
!124 = !DILocation(line: 87, column: 14, scope: !123)
!125 = !DILocation(line: 88, column: 9, scope: !123)
!126 = !DILocation(line: 88, column: 17, scope: !123)
!127 = !DILocalVariable(name: "source", scope: !128, file: !16, line: 91, type: !40)
!128 = distinct !DILexicalBlock(scope: !105, file: !16, line: 90, column: 5)
!129 = !DILocation(line: 91, column: 17, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !128, file: !16, line: 92, type: !45)
!131 = !DILocation(line: 92, column: 16, scope: !128)
!132 = !DILocalVariable(name: "sourceLen", scope: !128, file: !16, line: 92, type: !45)
!133 = !DILocation(line: 92, column: 19, scope: !128)
!134 = !DILocation(line: 93, column: 28, scope: !128)
!135 = !DILocation(line: 93, column: 21, scope: !128)
!136 = !DILocation(line: 93, column: 19, scope: !128)
!137 = !DILocation(line: 96, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !128, file: !16, line: 96, column: 9)
!139 = !DILocation(line: 96, column: 14, scope: !138)
!140 = !DILocation(line: 96, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !16, line: 96, column: 9)
!142 = !DILocation(line: 96, column: 25, scope: !141)
!143 = !DILocation(line: 96, column: 35, scope: !141)
!144 = !DILocation(line: 96, column: 23, scope: !141)
!145 = !DILocation(line: 96, column: 9, scope: !138)
!146 = !DILocation(line: 98, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !16, line: 97, column: 9)
!148 = !DILocation(line: 98, column: 23, scope: !147)
!149 = !DILocation(line: 98, column: 13, scope: !147)
!150 = !DILocation(line: 98, column: 18, scope: !147)
!151 = !DILocation(line: 98, column: 21, scope: !147)
!152 = !DILocation(line: 99, column: 9, scope: !147)
!153 = !DILocation(line: 96, column: 41, scope: !141)
!154 = !DILocation(line: 96, column: 9, scope: !141)
!155 = distinct !{!155, !145, !156, !73}
!156 = !DILocation(line: 99, column: 9, scope: !138)
!157 = !DILocation(line: 100, column: 20, scope: !128)
!158 = !DILocation(line: 100, column: 9, scope: !128)
!159 = !DILocation(line: 102, column: 1, scope: !105)
!160 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 35, type: !102, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!161 = !DILocation(line: 37, column: 5, scope: !160)
!162 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 105, type: !17, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!163 = !DILocalVariable(name: "data", scope: !162, file: !16, line: 107, type: !4)
!164 = !DILocation(line: 107, column: 15, scope: !162)
!165 = !DILocalVariable(name: "dataBadBuffer", scope: !162, file: !16, line: 108, type: !4)
!166 = !DILocation(line: 108, column: 15, scope: !162)
!167 = !DILocation(line: 108, column: 42, scope: !162)
!168 = !DILocation(line: 108, column: 31, scope: !162)
!169 = !DILocalVariable(name: "dataGoodBuffer", scope: !162, file: !16, line: 109, type: !4)
!170 = !DILocation(line: 109, column: 15, scope: !162)
!171 = !DILocation(line: 109, column: 43, scope: !162)
!172 = !DILocation(line: 109, column: 32, scope: !162)
!173 = !DILocation(line: 110, column: 8, scope: !174)
!174 = distinct !DILexicalBlock(scope: !162, file: !16, line: 110, column: 8)
!175 = !DILocation(line: 110, column: 8, scope: !162)
!176 = !DILocation(line: 114, column: 16, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !16, line: 111, column: 5)
!178 = !DILocation(line: 114, column: 14, scope: !177)
!179 = !DILocation(line: 115, column: 9, scope: !177)
!180 = !DILocation(line: 115, column: 17, scope: !177)
!181 = !DILocation(line: 116, column: 5, scope: !177)
!182 = !DILocalVariable(name: "source", scope: !183, file: !16, line: 118, type: !40)
!183 = distinct !DILexicalBlock(scope: !162, file: !16, line: 117, column: 5)
!184 = !DILocation(line: 118, column: 17, scope: !183)
!185 = !DILocalVariable(name: "i", scope: !183, file: !16, line: 119, type: !45)
!186 = !DILocation(line: 119, column: 16, scope: !183)
!187 = !DILocalVariable(name: "sourceLen", scope: !183, file: !16, line: 119, type: !45)
!188 = !DILocation(line: 119, column: 19, scope: !183)
!189 = !DILocation(line: 120, column: 28, scope: !183)
!190 = !DILocation(line: 120, column: 21, scope: !183)
!191 = !DILocation(line: 120, column: 19, scope: !183)
!192 = !DILocation(line: 123, column: 16, scope: !193)
!193 = distinct !DILexicalBlock(scope: !183, file: !16, line: 123, column: 9)
!194 = !DILocation(line: 123, column: 14, scope: !193)
!195 = !DILocation(line: 123, column: 21, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !16, line: 123, column: 9)
!197 = !DILocation(line: 123, column: 25, scope: !196)
!198 = !DILocation(line: 123, column: 35, scope: !196)
!199 = !DILocation(line: 123, column: 23, scope: !196)
!200 = !DILocation(line: 123, column: 9, scope: !193)
!201 = !DILocation(line: 125, column: 30, scope: !202)
!202 = distinct !DILexicalBlock(scope: !196, file: !16, line: 124, column: 9)
!203 = !DILocation(line: 125, column: 23, scope: !202)
!204 = !DILocation(line: 125, column: 13, scope: !202)
!205 = !DILocation(line: 125, column: 18, scope: !202)
!206 = !DILocation(line: 125, column: 21, scope: !202)
!207 = !DILocation(line: 126, column: 9, scope: !202)
!208 = !DILocation(line: 123, column: 41, scope: !196)
!209 = !DILocation(line: 123, column: 9, scope: !196)
!210 = distinct !{!210, !200, !211, !73}
!211 = !DILocation(line: 126, column: 9, scope: !193)
!212 = !DILocation(line: 127, column: 20, scope: !183)
!213 = !DILocation(line: 127, column: 9, scope: !183)
!214 = !DILocation(line: 129, column: 1, scope: !162)
