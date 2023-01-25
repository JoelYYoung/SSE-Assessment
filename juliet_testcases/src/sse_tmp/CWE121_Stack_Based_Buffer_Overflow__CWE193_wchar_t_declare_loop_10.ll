; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_10_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_10_bad() #0 !dbg !11 {
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
  %0 = load i32, i32* @globalTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %0, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_10_bad.source to i8*), i64 44, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !50
  store i64 %call, i64* %sourceLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !55
  %4 = load i64, i64* %sourceLen, align 8, !dbg !57
  %add = add i64 %4, 1, !dbg !58
  %cmp = icmp ult i64 %3, %add, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !63
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !63
  %7 = load i32*, i32** %data, align 8, !dbg !64
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !64
  store i32 %6, i32* %arrayidx3, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %9, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !73
  call void @printWLine(i32* %10), !dbg !74
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_10_good() #0 !dbg !76 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_10_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_10_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = load i32, i32* @globalFalse, align 4, !dbg !107
  %tobool = icmp ne i32 %0, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i32* %arraydecay, i32** %data, align 8, !dbg !115
  %1 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !125
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !126
  store i64 %call, i64* %sourceLen, align 8, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !131
  %4 = load i64, i64* %sourceLen, align 8, !dbg !133
  %add = add i64 %4, 1, !dbg !134
  %cmp = icmp ult i64 %3, %add, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !139
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !139
  %7 = load i32*, i32** %data, align 8, !dbg !140
  %8 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !140
  store i32 %6, i32* %arrayidx3, align 4, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %9, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !148
  call void @printWLine(i32* %10), !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %0 = load i32, i32* @globalTrue, align 4, !dbg !158
  %tobool = icmp ne i32 %0, 0, !dbg !158
  br i1 %tobool, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !161
  store i32* %arraydecay, i32** %data, align 8, !dbg !163
  %1 = load i32*, i32** %data, align 8, !dbg !164
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !164
  store i32 0, i32* %arrayidx, align 4, !dbg !165
  br label %if.end, !dbg !166

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !167, metadata !DIExpression()), !dbg !169
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !169
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !169
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !172, metadata !DIExpression()), !dbg !173
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !174
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !175
  store i64 %call, i64* %sourceLen, align 8, !dbg !176
  store i64 0, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !180
  %4 = load i64, i64* %sourceLen, align 8, !dbg !182
  %add = add i64 %4, 1, !dbg !183
  %cmp = icmp ult i64 %3, %add, !dbg !184
  br i1 %cmp, label %for.body, label %for.end, !dbg !185

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !188
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !188
  %7 = load i32*, i32** %data, align 8, !dbg !189
  %8 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !189
  store i32 %6, i32* %arrayidx3, align 4, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !193
  %inc = add i64 %9, 1, !dbg !193
  store i64 %inc, i64* %i, align 8, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !197
  call void @printWLine(i32* %10), !dbg !198
  ret void, !dbg !199
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_10_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!33 = !DILocation(line: 33, column: 8, scope: !11)
!34 = !DILocation(line: 37, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 34, column: 5)
!36 = !DILocation(line: 37, column: 14, scope: !35)
!37 = !DILocation(line: 38, column: 9, scope: !35)
!38 = !DILocation(line: 38, column: 17, scope: !35)
!39 = !DILocation(line: 39, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 41, type: !27)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!42 = !DILocation(line: 41, column: 17, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 42, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 42, column: 16, scope: !41)
!47 = !DILocalVariable(name: "sourceLen", scope: !41, file: !12, line: 42, type: !44)
!48 = !DILocation(line: 42, column: 19, scope: !41)
!49 = !DILocation(line: 43, column: 28, scope: !41)
!50 = !DILocation(line: 43, column: 21, scope: !41)
!51 = !DILocation(line: 43, column: 19, scope: !41)
!52 = !DILocation(line: 46, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !41, file: !12, line: 46, column: 9)
!54 = !DILocation(line: 46, column: 14, scope: !53)
!55 = !DILocation(line: 46, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 46, column: 9)
!57 = !DILocation(line: 46, column: 25, scope: !56)
!58 = !DILocation(line: 46, column: 35, scope: !56)
!59 = !DILocation(line: 46, column: 23, scope: !56)
!60 = !DILocation(line: 46, column: 9, scope: !53)
!61 = !DILocation(line: 48, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !12, line: 47, column: 9)
!63 = !DILocation(line: 48, column: 23, scope: !62)
!64 = !DILocation(line: 48, column: 13, scope: !62)
!65 = !DILocation(line: 48, column: 18, scope: !62)
!66 = !DILocation(line: 48, column: 21, scope: !62)
!67 = !DILocation(line: 49, column: 9, scope: !62)
!68 = !DILocation(line: 46, column: 41, scope: !56)
!69 = !DILocation(line: 46, column: 9, scope: !56)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 49, column: 9, scope: !53)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 50, column: 20, scope: !41)
!74 = !DILocation(line: 50, column: 9, scope: !41)
!75 = !DILocation(line: 52, column: 1, scope: !11)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_10_good", scope: !12, file: !12, line: 117, type: !13, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 119, column: 5, scope: !76)
!78 = !DILocation(line: 120, column: 5, scope: !76)
!79 = !DILocation(line: 121, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 133, type: !81, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!19, !19, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !12, line: 133, type: !19)
!87 = !DILocation(line: 133, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !12, line: 133, type: !83)
!89 = !DILocation(line: 133, column: 27, scope: !80)
!90 = !DILocation(line: 136, column: 22, scope: !80)
!91 = !DILocation(line: 136, column: 12, scope: !80)
!92 = !DILocation(line: 136, column: 5, scope: !80)
!93 = !DILocation(line: 138, column: 5, scope: !80)
!94 = !DILocation(line: 139, column: 5, scope: !80)
!95 = !DILocation(line: 140, column: 5, scope: !80)
!96 = !DILocation(line: 143, column: 5, scope: !80)
!97 = !DILocation(line: 144, column: 5, scope: !80)
!98 = !DILocation(line: 145, column: 5, scope: !80)
!99 = !DILocation(line: 147, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 61, type: !16)
!102 = !DILocation(line: 61, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !12, line: 62, type: !22)
!104 = !DILocation(line: 62, column: 13, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !12, line: 63, type: !27)
!106 = !DILocation(line: 63, column: 13, scope: !100)
!107 = !DILocation(line: 64, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !12, line: 64, column: 8)
!109 = !DILocation(line: 64, column: 8, scope: !100)
!110 = !DILocation(line: 67, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !12, line: 65, column: 5)
!112 = !DILocation(line: 68, column: 5, scope: !111)
!113 = !DILocation(line: 73, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !12, line: 70, column: 5)
!115 = !DILocation(line: 73, column: 14, scope: !114)
!116 = !DILocation(line: 74, column: 9, scope: !114)
!117 = !DILocation(line: 74, column: 17, scope: !114)
!118 = !DILocalVariable(name: "source", scope: !119, file: !12, line: 77, type: !27)
!119 = distinct !DILexicalBlock(scope: !100, file: !12, line: 76, column: 5)
!120 = !DILocation(line: 77, column: 17, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !119, file: !12, line: 78, type: !44)
!122 = !DILocation(line: 78, column: 16, scope: !119)
!123 = !DILocalVariable(name: "sourceLen", scope: !119, file: !12, line: 78, type: !44)
!124 = !DILocation(line: 78, column: 19, scope: !119)
!125 = !DILocation(line: 79, column: 28, scope: !119)
!126 = !DILocation(line: 79, column: 21, scope: !119)
!127 = !DILocation(line: 79, column: 19, scope: !119)
!128 = !DILocation(line: 82, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !119, file: !12, line: 82, column: 9)
!130 = !DILocation(line: 82, column: 14, scope: !129)
!131 = !DILocation(line: 82, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 82, column: 9)
!133 = !DILocation(line: 82, column: 25, scope: !132)
!134 = !DILocation(line: 82, column: 35, scope: !132)
!135 = !DILocation(line: 82, column: 23, scope: !132)
!136 = !DILocation(line: 82, column: 9, scope: !129)
!137 = !DILocation(line: 84, column: 30, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !12, line: 83, column: 9)
!139 = !DILocation(line: 84, column: 23, scope: !138)
!140 = !DILocation(line: 84, column: 13, scope: !138)
!141 = !DILocation(line: 84, column: 18, scope: !138)
!142 = !DILocation(line: 84, column: 21, scope: !138)
!143 = !DILocation(line: 85, column: 9, scope: !138)
!144 = !DILocation(line: 82, column: 41, scope: !132)
!145 = !DILocation(line: 82, column: 9, scope: !132)
!146 = distinct !{!146, !136, !147, !72}
!147 = !DILocation(line: 85, column: 9, scope: !129)
!148 = !DILocation(line: 86, column: 20, scope: !119)
!149 = !DILocation(line: 86, column: 9, scope: !119)
!150 = !DILocation(line: 88, column: 1, scope: !100)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !12, line: 93, type: !16)
!153 = !DILocation(line: 93, column: 15, scope: !151)
!154 = !DILocalVariable(name: "dataBadBuffer", scope: !151, file: !12, line: 94, type: !22)
!155 = !DILocation(line: 94, column: 13, scope: !151)
!156 = !DILocalVariable(name: "dataGoodBuffer", scope: !151, file: !12, line: 95, type: !27)
!157 = !DILocation(line: 95, column: 13, scope: !151)
!158 = !DILocation(line: 96, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !151, file: !12, line: 96, column: 8)
!160 = !DILocation(line: 96, column: 8, scope: !151)
!161 = !DILocation(line: 100, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 97, column: 5)
!163 = !DILocation(line: 100, column: 14, scope: !162)
!164 = !DILocation(line: 101, column: 9, scope: !162)
!165 = !DILocation(line: 101, column: 17, scope: !162)
!166 = !DILocation(line: 102, column: 5, scope: !162)
!167 = !DILocalVariable(name: "source", scope: !168, file: !12, line: 104, type: !27)
!168 = distinct !DILexicalBlock(scope: !151, file: !12, line: 103, column: 5)
!169 = !DILocation(line: 104, column: 17, scope: !168)
!170 = !DILocalVariable(name: "i", scope: !168, file: !12, line: 105, type: !44)
!171 = !DILocation(line: 105, column: 16, scope: !168)
!172 = !DILocalVariable(name: "sourceLen", scope: !168, file: !12, line: 105, type: !44)
!173 = !DILocation(line: 105, column: 19, scope: !168)
!174 = !DILocation(line: 106, column: 28, scope: !168)
!175 = !DILocation(line: 106, column: 21, scope: !168)
!176 = !DILocation(line: 106, column: 19, scope: !168)
!177 = !DILocation(line: 109, column: 16, scope: !178)
!178 = distinct !DILexicalBlock(scope: !168, file: !12, line: 109, column: 9)
!179 = !DILocation(line: 109, column: 14, scope: !178)
!180 = !DILocation(line: 109, column: 21, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !12, line: 109, column: 9)
!182 = !DILocation(line: 109, column: 25, scope: !181)
!183 = !DILocation(line: 109, column: 35, scope: !181)
!184 = !DILocation(line: 109, column: 23, scope: !181)
!185 = !DILocation(line: 109, column: 9, scope: !178)
!186 = !DILocation(line: 111, column: 30, scope: !187)
!187 = distinct !DILexicalBlock(scope: !181, file: !12, line: 110, column: 9)
!188 = !DILocation(line: 111, column: 23, scope: !187)
!189 = !DILocation(line: 111, column: 13, scope: !187)
!190 = !DILocation(line: 111, column: 18, scope: !187)
!191 = !DILocation(line: 111, column: 21, scope: !187)
!192 = !DILocation(line: 112, column: 9, scope: !187)
!193 = !DILocation(line: 109, column: 41, scope: !181)
!194 = !DILocation(line: 109, column: 9, scope: !181)
!195 = distinct !{!195, !185, !196, !72}
!196 = !DILocation(line: 112, column: 9, scope: !178)
!197 = !DILocation(line: 113, column: 20, scope: !168)
!198 = !DILocation(line: 113, column: 9, scope: !168)
!199 = !DILocation(line: 115, column: 1, scope: !151)
