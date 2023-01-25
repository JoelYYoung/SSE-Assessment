; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_08_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %call = call i32 @staticReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %0 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_08_bad.source to i8*), i64 44, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !50
  store i64 %call2, i64* %sourceLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !55
  %3 = load i64, i64* %sourceLen, align 8, !dbg !57
  %add = add i64 %3, 1, !dbg !58
  %cmp = icmp ult i64 %2, %add, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !63
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !63
  %6 = load i32*, i32** %data, align 8, !dbg !64
  %7 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !64
  store i32 %5, i32* %arrayidx4, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %8, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !73
  call void @printWLine(i32* %9), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_08_good() #0 !dbg !76 {
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
  %call = call i64 @time(i64* null) #7, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #7, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_08_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_08_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !100 {
entry:
  ret i32 1, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i32 @staticReturnsFalse(), !dbg !111
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !117
  store i32* %arraydecay, i32** %data, align 8, !dbg !119
  %0 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !129
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !130
  store i64 %call2, i64* %sourceLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !135
  %3 = load i64, i64* %sourceLen, align 8, !dbg !137
  %add = add i64 %3, 1, !dbg !138
  %cmp = icmp ult i64 %2, %add, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !143
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !143
  %6 = load i32*, i32** %data, align 8, !dbg !144
  %7 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !144
  store i32 %5, i32* %arrayidx4, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %8, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !152
  call void @printWLine(i32* %9), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !155 {
entry:
  ret i32 0, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !157 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !162, metadata !DIExpression()), !dbg !163
  %call = call i32 @staticReturnsTrue(), !dbg !164
  %tobool = icmp ne i32 %call, 0, !dbg !164
  br i1 %tobool, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !167
  store i32* %arraydecay, i32** %data, align 8, !dbg !169
  %0 = load i32*, i32** %data, align 8, !dbg !170
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !170
  store i32 0, i32* %arrayidx, align 4, !dbg !171
  br label %if.end, !dbg !172

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !173, metadata !DIExpression()), !dbg !175
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !175
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %i, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !178, metadata !DIExpression()), !dbg !179
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !180
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !181
  store i64 %call2, i64* %sourceLen, align 8, !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !186
  %3 = load i64, i64* %sourceLen, align 8, !dbg !188
  %add = add i64 %3, 1, !dbg !189
  %cmp = icmp ult i64 %2, %add, !dbg !190
  br i1 %cmp, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !194
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !194
  %6 = load i32*, i32** %data, align 8, !dbg !195
  %7 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !195
  store i32 %5, i32* %arrayidx4, align 4, !dbg !197
  br label %for.inc, !dbg !198

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !199
  %inc = add i64 %8, 1, !dbg !199
  store i64 %inc, i64* %i, align 8, !dbg !199
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !203
  call void @printWLine(i32* %9), !dbg !204
  ret void, !dbg !205
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_08_bad", scope: !12, file: !12, line: 42, type: !13, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 44, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 44, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 45, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 45, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 46, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 46, column: 13, scope: !11)
!31 = !DILocation(line: 47, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 47, column: 8)
!33 = !DILocation(line: 47, column: 8, scope: !11)
!34 = !DILocation(line: 51, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 48, column: 5)
!36 = !DILocation(line: 51, column: 14, scope: !35)
!37 = !DILocation(line: 52, column: 9, scope: !35)
!38 = !DILocation(line: 52, column: 17, scope: !35)
!39 = !DILocation(line: 53, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 55, type: !27)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 54, column: 5)
!42 = !DILocation(line: 55, column: 17, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 56, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 56, column: 16, scope: !41)
!47 = !DILocalVariable(name: "sourceLen", scope: !41, file: !12, line: 56, type: !44)
!48 = !DILocation(line: 56, column: 19, scope: !41)
!49 = !DILocation(line: 57, column: 28, scope: !41)
!50 = !DILocation(line: 57, column: 21, scope: !41)
!51 = !DILocation(line: 57, column: 19, scope: !41)
!52 = !DILocation(line: 60, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !41, file: !12, line: 60, column: 9)
!54 = !DILocation(line: 60, column: 14, scope: !53)
!55 = !DILocation(line: 60, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 60, column: 9)
!57 = !DILocation(line: 60, column: 25, scope: !56)
!58 = !DILocation(line: 60, column: 35, scope: !56)
!59 = !DILocation(line: 60, column: 23, scope: !56)
!60 = !DILocation(line: 60, column: 9, scope: !53)
!61 = !DILocation(line: 62, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !12, line: 61, column: 9)
!63 = !DILocation(line: 62, column: 23, scope: !62)
!64 = !DILocation(line: 62, column: 13, scope: !62)
!65 = !DILocation(line: 62, column: 18, scope: !62)
!66 = !DILocation(line: 62, column: 21, scope: !62)
!67 = !DILocation(line: 63, column: 9, scope: !62)
!68 = !DILocation(line: 60, column: 41, scope: !56)
!69 = !DILocation(line: 60, column: 9, scope: !56)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 63, column: 9, scope: !53)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 64, column: 20, scope: !41)
!74 = !DILocation(line: 64, column: 9, scope: !41)
!75 = !DILocation(line: 66, column: 1, scope: !11)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_08_good", scope: !12, file: !12, line: 131, type: !13, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 133, column: 5, scope: !76)
!78 = !DILocation(line: 134, column: 5, scope: !76)
!79 = !DILocation(line: 135, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 147, type: !81, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!19, !19, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !12, line: 147, type: !19)
!87 = !DILocation(line: 147, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !12, line: 147, type: !83)
!89 = !DILocation(line: 147, column: 27, scope: !80)
!90 = !DILocation(line: 150, column: 22, scope: !80)
!91 = !DILocation(line: 150, column: 12, scope: !80)
!92 = !DILocation(line: 150, column: 5, scope: !80)
!93 = !DILocation(line: 152, column: 5, scope: !80)
!94 = !DILocation(line: 153, column: 5, scope: !80)
!95 = !DILocation(line: 154, column: 5, scope: !80)
!96 = !DILocation(line: 157, column: 5, scope: !80)
!97 = !DILocation(line: 158, column: 5, scope: !80)
!98 = !DILocation(line: 159, column: 5, scope: !80)
!99 = !DILocation(line: 161, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 30, type: !101, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!19}
!103 = !DILocation(line: 32, column: 5, scope: !100)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 75, type: !16)
!106 = !DILocation(line: 75, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 76, type: !22)
!108 = !DILocation(line: 76, column: 13, scope: !104)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 77, type: !27)
!110 = !DILocation(line: 77, column: 13, scope: !104)
!111 = !DILocation(line: 78, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !12, line: 78, column: 8)
!113 = !DILocation(line: 78, column: 8, scope: !104)
!114 = !DILocation(line: 81, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 79, column: 5)
!116 = !DILocation(line: 82, column: 5, scope: !115)
!117 = !DILocation(line: 87, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !12, line: 84, column: 5)
!119 = !DILocation(line: 87, column: 14, scope: !118)
!120 = !DILocation(line: 88, column: 9, scope: !118)
!121 = !DILocation(line: 88, column: 17, scope: !118)
!122 = !DILocalVariable(name: "source", scope: !123, file: !12, line: 91, type: !27)
!123 = distinct !DILexicalBlock(scope: !104, file: !12, line: 90, column: 5)
!124 = !DILocation(line: 91, column: 17, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !12, line: 92, type: !44)
!126 = !DILocation(line: 92, column: 16, scope: !123)
!127 = !DILocalVariable(name: "sourceLen", scope: !123, file: !12, line: 92, type: !44)
!128 = !DILocation(line: 92, column: 19, scope: !123)
!129 = !DILocation(line: 93, column: 28, scope: !123)
!130 = !DILocation(line: 93, column: 21, scope: !123)
!131 = !DILocation(line: 93, column: 19, scope: !123)
!132 = !DILocation(line: 96, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !12, line: 96, column: 9)
!134 = !DILocation(line: 96, column: 14, scope: !133)
!135 = !DILocation(line: 96, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 96, column: 9)
!137 = !DILocation(line: 96, column: 25, scope: !136)
!138 = !DILocation(line: 96, column: 35, scope: !136)
!139 = !DILocation(line: 96, column: 23, scope: !136)
!140 = !DILocation(line: 96, column: 9, scope: !133)
!141 = !DILocation(line: 98, column: 30, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !12, line: 97, column: 9)
!143 = !DILocation(line: 98, column: 23, scope: !142)
!144 = !DILocation(line: 98, column: 13, scope: !142)
!145 = !DILocation(line: 98, column: 18, scope: !142)
!146 = !DILocation(line: 98, column: 21, scope: !142)
!147 = !DILocation(line: 99, column: 9, scope: !142)
!148 = !DILocation(line: 96, column: 41, scope: !136)
!149 = !DILocation(line: 96, column: 9, scope: !136)
!150 = distinct !{!150, !140, !151, !72}
!151 = !DILocation(line: 99, column: 9, scope: !133)
!152 = !DILocation(line: 100, column: 20, scope: !123)
!153 = !DILocation(line: 100, column: 9, scope: !123)
!154 = !DILocation(line: 102, column: 1, scope: !104)
!155 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 35, type: !101, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DILocation(line: 37, column: 5, scope: !155)
!157 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "data", scope: !157, file: !12, line: 107, type: !16)
!159 = !DILocation(line: 107, column: 15, scope: !157)
!160 = !DILocalVariable(name: "dataBadBuffer", scope: !157, file: !12, line: 108, type: !22)
!161 = !DILocation(line: 108, column: 13, scope: !157)
!162 = !DILocalVariable(name: "dataGoodBuffer", scope: !157, file: !12, line: 109, type: !27)
!163 = !DILocation(line: 109, column: 13, scope: !157)
!164 = !DILocation(line: 110, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !157, file: !12, line: 110, column: 8)
!166 = !DILocation(line: 110, column: 8, scope: !157)
!167 = !DILocation(line: 114, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !12, line: 111, column: 5)
!169 = !DILocation(line: 114, column: 14, scope: !168)
!170 = !DILocation(line: 115, column: 9, scope: !168)
!171 = !DILocation(line: 115, column: 17, scope: !168)
!172 = !DILocation(line: 116, column: 5, scope: !168)
!173 = !DILocalVariable(name: "source", scope: !174, file: !12, line: 118, type: !27)
!174 = distinct !DILexicalBlock(scope: !157, file: !12, line: 117, column: 5)
!175 = !DILocation(line: 118, column: 17, scope: !174)
!176 = !DILocalVariable(name: "i", scope: !174, file: !12, line: 119, type: !44)
!177 = !DILocation(line: 119, column: 16, scope: !174)
!178 = !DILocalVariable(name: "sourceLen", scope: !174, file: !12, line: 119, type: !44)
!179 = !DILocation(line: 119, column: 19, scope: !174)
!180 = !DILocation(line: 120, column: 28, scope: !174)
!181 = !DILocation(line: 120, column: 21, scope: !174)
!182 = !DILocation(line: 120, column: 19, scope: !174)
!183 = !DILocation(line: 123, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !174, file: !12, line: 123, column: 9)
!185 = !DILocation(line: 123, column: 14, scope: !184)
!186 = !DILocation(line: 123, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !12, line: 123, column: 9)
!188 = !DILocation(line: 123, column: 25, scope: !187)
!189 = !DILocation(line: 123, column: 35, scope: !187)
!190 = !DILocation(line: 123, column: 23, scope: !187)
!191 = !DILocation(line: 123, column: 9, scope: !184)
!192 = !DILocation(line: 125, column: 30, scope: !193)
!193 = distinct !DILexicalBlock(scope: !187, file: !12, line: 124, column: 9)
!194 = !DILocation(line: 125, column: 23, scope: !193)
!195 = !DILocation(line: 125, column: 13, scope: !193)
!196 = !DILocation(line: 125, column: 18, scope: !193)
!197 = !DILocation(line: 125, column: 21, scope: !193)
!198 = !DILocation(line: 126, column: 9, scope: !193)
!199 = !DILocation(line: 123, column: 41, scope: !187)
!200 = !DILocation(line: 123, column: 9, scope: !187)
!201 = distinct !{!201, !191, !202, !72}
!202 = !DILocation(line: 126, column: 9, scope: !184)
!203 = !DILocation(line: 127, column: 20, scope: !174)
!204 = !DILocation(line: 127, column: 9, scope: !174)
!205 = !DILocation(line: 129, column: 1, scope: !157)
