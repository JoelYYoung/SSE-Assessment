; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_14_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_14_bad() #0 !dbg !11 {
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
  %0 = load i32, i32* @globalFive, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !43
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_14_bad.source to i8*), i64 44, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !51
  store i64 %call, i64* %sourceLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !56
  %4 = load i64, i64* %sourceLen, align 8, !dbg !58
  %add = add i64 %4, 1, !dbg !59
  %cmp2 = icmp ult i64 %3, %add, !dbg !60
  br i1 %cmp2, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !64
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !64
  %7 = load i32*, i32** %data, align 8, !dbg !65
  %8 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !65
  store i32 %6, i32* %arrayidx4, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %9, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !74
  call void @printWLine(i32* %10), !dbg !75
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_14_good() #0 !dbg !77 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_14_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_14_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i32, i32* @globalFive, align 4, !dbg !108
  %cmp = icmp ne i32 %0, 5, !dbg !110
  br i1 %cmp, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !115
  store i32* %arraydecay, i32** %data, align 8, !dbg !117
  %1 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !127
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !128
  store i64 %call, i64* %sourceLen, align 8, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !133
  %4 = load i64, i64* %sourceLen, align 8, !dbg !135
  %add = add i64 %4, 1, !dbg !136
  %cmp2 = icmp ult i64 %3, %add, !dbg !137
  br i1 %cmp2, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !141
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !141
  %7 = load i32*, i32** %data, align 8, !dbg !142
  %8 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !142
  store i32 %6, i32* %arrayidx4, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %9, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !150
  call void @printWLine(i32* %10), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !153 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  %0 = load i32, i32* @globalFive, align 4, !dbg !160
  %cmp = icmp eq i32 %0, 5, !dbg !162
  br i1 %cmp, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !164
  store i32* %arraydecay, i32** %data, align 8, !dbg !166
  %1 = load i32*, i32** %data, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !167
  store i32 0, i32* %arrayidx, align 4, !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !170, metadata !DIExpression()), !dbg !172
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !172
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !175, metadata !DIExpression()), !dbg !176
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !177
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !178
  store i64 %call, i64* %sourceLen, align 8, !dbg !179
  store i64 0, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !183
  %4 = load i64, i64* %sourceLen, align 8, !dbg !185
  %add = add i64 %4, 1, !dbg !186
  %cmp2 = icmp ult i64 %3, %add, !dbg !187
  br i1 %cmp2, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !191
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !191
  %7 = load i32*, i32** %data, align 8, !dbg !192
  %8 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx4 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !192
  store i32 %6, i32* %arrayidx4, align 4, !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !196
  %inc = add i64 %9, 1, !dbg !196
  store i64 %inc, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !200
  call void @printWLine(i32* %10), !dbg !201
  ret void, !dbg !202
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_14_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 31, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 32, column: 13, scope: !11)
!31 = !DILocation(line: 33, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!33 = !DILocation(line: 33, column: 18, scope: !32)
!34 = !DILocation(line: 33, column: 8, scope: !11)
!35 = !DILocation(line: 37, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 34, column: 5)
!37 = !DILocation(line: 37, column: 14, scope: !36)
!38 = !DILocation(line: 38, column: 9, scope: !36)
!39 = !DILocation(line: 38, column: 17, scope: !36)
!40 = !DILocation(line: 39, column: 5, scope: !36)
!41 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 41, type: !27)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!43 = !DILocation(line: 41, column: 17, scope: !42)
!44 = !DILocalVariable(name: "i", scope: !42, file: !12, line: 42, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 42, column: 16, scope: !42)
!48 = !DILocalVariable(name: "sourceLen", scope: !42, file: !12, line: 42, type: !45)
!49 = !DILocation(line: 42, column: 19, scope: !42)
!50 = !DILocation(line: 43, column: 28, scope: !42)
!51 = !DILocation(line: 43, column: 21, scope: !42)
!52 = !DILocation(line: 43, column: 19, scope: !42)
!53 = !DILocation(line: 46, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !42, file: !12, line: 46, column: 9)
!55 = !DILocation(line: 46, column: 14, scope: !54)
!56 = !DILocation(line: 46, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !12, line: 46, column: 9)
!58 = !DILocation(line: 46, column: 25, scope: !57)
!59 = !DILocation(line: 46, column: 35, scope: !57)
!60 = !DILocation(line: 46, column: 23, scope: !57)
!61 = !DILocation(line: 46, column: 9, scope: !54)
!62 = !DILocation(line: 48, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !12, line: 47, column: 9)
!64 = !DILocation(line: 48, column: 23, scope: !63)
!65 = !DILocation(line: 48, column: 13, scope: !63)
!66 = !DILocation(line: 48, column: 18, scope: !63)
!67 = !DILocation(line: 48, column: 21, scope: !63)
!68 = !DILocation(line: 49, column: 9, scope: !63)
!69 = !DILocation(line: 46, column: 41, scope: !57)
!70 = !DILocation(line: 46, column: 9, scope: !57)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 49, column: 9, scope: !54)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 50, column: 20, scope: !42)
!75 = !DILocation(line: 50, column: 9, scope: !42)
!76 = !DILocation(line: 52, column: 1, scope: !11)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_14_good", scope: !12, file: !12, line: 117, type: !13, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 119, column: 5, scope: !77)
!79 = !DILocation(line: 120, column: 5, scope: !77)
!80 = !DILocation(line: 121, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 133, type: !82, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!19, !19, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !12, line: 133, type: !19)
!88 = !DILocation(line: 133, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !12, line: 133, type: !84)
!90 = !DILocation(line: 133, column: 27, scope: !81)
!91 = !DILocation(line: 136, column: 22, scope: !81)
!92 = !DILocation(line: 136, column: 12, scope: !81)
!93 = !DILocation(line: 136, column: 5, scope: !81)
!94 = !DILocation(line: 138, column: 5, scope: !81)
!95 = !DILocation(line: 139, column: 5, scope: !81)
!96 = !DILocation(line: 140, column: 5, scope: !81)
!97 = !DILocation(line: 143, column: 5, scope: !81)
!98 = !DILocation(line: 144, column: 5, scope: !81)
!99 = !DILocation(line: 145, column: 5, scope: !81)
!100 = !DILocation(line: 147, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 61, type: !16)
!103 = !DILocation(line: 61, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !12, line: 62, type: !22)
!105 = !DILocation(line: 62, column: 13, scope: !101)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !12, line: 63, type: !27)
!107 = !DILocation(line: 63, column: 13, scope: !101)
!108 = !DILocation(line: 64, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !101, file: !12, line: 64, column: 8)
!110 = !DILocation(line: 64, column: 18, scope: !109)
!111 = !DILocation(line: 64, column: 8, scope: !101)
!112 = !DILocation(line: 67, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !12, line: 65, column: 5)
!114 = !DILocation(line: 68, column: 5, scope: !113)
!115 = !DILocation(line: 73, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !109, file: !12, line: 70, column: 5)
!117 = !DILocation(line: 73, column: 14, scope: !116)
!118 = !DILocation(line: 74, column: 9, scope: !116)
!119 = !DILocation(line: 74, column: 17, scope: !116)
!120 = !DILocalVariable(name: "source", scope: !121, file: !12, line: 77, type: !27)
!121 = distinct !DILexicalBlock(scope: !101, file: !12, line: 76, column: 5)
!122 = !DILocation(line: 77, column: 17, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !121, file: !12, line: 78, type: !45)
!124 = !DILocation(line: 78, column: 16, scope: !121)
!125 = !DILocalVariable(name: "sourceLen", scope: !121, file: !12, line: 78, type: !45)
!126 = !DILocation(line: 78, column: 19, scope: !121)
!127 = !DILocation(line: 79, column: 28, scope: !121)
!128 = !DILocation(line: 79, column: 21, scope: !121)
!129 = !DILocation(line: 79, column: 19, scope: !121)
!130 = !DILocation(line: 82, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !121, file: !12, line: 82, column: 9)
!132 = !DILocation(line: 82, column: 14, scope: !131)
!133 = !DILocation(line: 82, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 82, column: 9)
!135 = !DILocation(line: 82, column: 25, scope: !134)
!136 = !DILocation(line: 82, column: 35, scope: !134)
!137 = !DILocation(line: 82, column: 23, scope: !134)
!138 = !DILocation(line: 82, column: 9, scope: !131)
!139 = !DILocation(line: 84, column: 30, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !12, line: 83, column: 9)
!141 = !DILocation(line: 84, column: 23, scope: !140)
!142 = !DILocation(line: 84, column: 13, scope: !140)
!143 = !DILocation(line: 84, column: 18, scope: !140)
!144 = !DILocation(line: 84, column: 21, scope: !140)
!145 = !DILocation(line: 85, column: 9, scope: !140)
!146 = !DILocation(line: 82, column: 41, scope: !134)
!147 = !DILocation(line: 82, column: 9, scope: !134)
!148 = distinct !{!148, !138, !149, !73}
!149 = !DILocation(line: 85, column: 9, scope: !131)
!150 = !DILocation(line: 86, column: 20, scope: !121)
!151 = !DILocation(line: 86, column: 9, scope: !121)
!152 = !DILocation(line: 88, column: 1, scope: !101)
!153 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocalVariable(name: "data", scope: !153, file: !12, line: 93, type: !16)
!155 = !DILocation(line: 93, column: 15, scope: !153)
!156 = !DILocalVariable(name: "dataBadBuffer", scope: !153, file: !12, line: 94, type: !22)
!157 = !DILocation(line: 94, column: 13, scope: !153)
!158 = !DILocalVariable(name: "dataGoodBuffer", scope: !153, file: !12, line: 95, type: !27)
!159 = !DILocation(line: 95, column: 13, scope: !153)
!160 = !DILocation(line: 96, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !153, file: !12, line: 96, column: 8)
!162 = !DILocation(line: 96, column: 18, scope: !161)
!163 = !DILocation(line: 96, column: 8, scope: !153)
!164 = !DILocation(line: 100, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 97, column: 5)
!166 = !DILocation(line: 100, column: 14, scope: !165)
!167 = !DILocation(line: 101, column: 9, scope: !165)
!168 = !DILocation(line: 101, column: 17, scope: !165)
!169 = !DILocation(line: 102, column: 5, scope: !165)
!170 = !DILocalVariable(name: "source", scope: !171, file: !12, line: 104, type: !27)
!171 = distinct !DILexicalBlock(scope: !153, file: !12, line: 103, column: 5)
!172 = !DILocation(line: 104, column: 17, scope: !171)
!173 = !DILocalVariable(name: "i", scope: !171, file: !12, line: 105, type: !45)
!174 = !DILocation(line: 105, column: 16, scope: !171)
!175 = !DILocalVariable(name: "sourceLen", scope: !171, file: !12, line: 105, type: !45)
!176 = !DILocation(line: 105, column: 19, scope: !171)
!177 = !DILocation(line: 106, column: 28, scope: !171)
!178 = !DILocation(line: 106, column: 21, scope: !171)
!179 = !DILocation(line: 106, column: 19, scope: !171)
!180 = !DILocation(line: 109, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !171, file: !12, line: 109, column: 9)
!182 = !DILocation(line: 109, column: 14, scope: !181)
!183 = !DILocation(line: 109, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !12, line: 109, column: 9)
!185 = !DILocation(line: 109, column: 25, scope: !184)
!186 = !DILocation(line: 109, column: 35, scope: !184)
!187 = !DILocation(line: 109, column: 23, scope: !184)
!188 = !DILocation(line: 109, column: 9, scope: !181)
!189 = !DILocation(line: 111, column: 30, scope: !190)
!190 = distinct !DILexicalBlock(scope: !184, file: !12, line: 110, column: 9)
!191 = !DILocation(line: 111, column: 23, scope: !190)
!192 = !DILocation(line: 111, column: 13, scope: !190)
!193 = !DILocation(line: 111, column: 18, scope: !190)
!194 = !DILocation(line: 111, column: 21, scope: !190)
!195 = !DILocation(line: 112, column: 9, scope: !190)
!196 = !DILocation(line: 109, column: 41, scope: !184)
!197 = !DILocation(line: 109, column: 9, scope: !184)
!198 = distinct !{!198, !188, !199, !73}
!199 = !DILocation(line: 112, column: 9, scope: !181)
!200 = !DILocation(line: 113, column: 20, scope: !171)
!201 = !DILocation(line: 113, column: 9, scope: !171)
!202 = !DILocation(line: 115, column: 1, scope: !153)
