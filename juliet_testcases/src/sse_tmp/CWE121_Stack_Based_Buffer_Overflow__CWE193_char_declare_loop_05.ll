; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_05_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay, i8** %data, align 8, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_05_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !52, metadata !DIExpression()), !dbg !53
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !55
  store i64 %call, i64* %sourceLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !60
  %4 = load i64, i64* %sourceLen, align 8, !dbg !62
  %add = add i64 %4, 1, !dbg !63
  %cmp = icmp ult i64 %3, %add, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !68
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !68
  %7 = load i8*, i8** %data, align 8, !dbg !69
  %8 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !69
  store i8 %6, i8* %arrayidx3, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %9, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !78
  call void @printLine(i8* %10), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_05_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_05_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_05_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = load i32, i32* @staticFalse, align 4, !dbg !110
  %tobool = icmp ne i32 %0, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  store i8* %arraydecay, i8** %data, align 8, !dbg !118
  %1 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !128
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !129
  store i64 %call, i64* %sourceLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !134
  %4 = load i64, i64* %sourceLen, align 8, !dbg !136
  %add = add i64 %4, 1, !dbg !137
  %cmp = icmp ult i64 %3, %add, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !142
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !142
  %7 = load i8*, i8** %data, align 8, !dbg !143
  %8 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !143
  store i8 %6, i8* %arrayidx3, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %9, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !151
  call void @printLine(i8* %10), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !154 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = load i32, i32* @staticTrue, align 4, !dbg !161
  %tobool = icmp ne i32 %0, 0, !dbg !161
  br i1 %tobool, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !164
  store i8* %arraydecay, i8** %data, align 8, !dbg !166
  %1 = load i8*, i8** %data, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !170, metadata !DIExpression()), !dbg !172
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !172
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !175, metadata !DIExpression()), !dbg !176
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !177
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !178
  store i64 %call, i64* %sourceLen, align 8, !dbg !179
  store i64 0, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !183
  %4 = load i64, i64* %sourceLen, align 8, !dbg !185
  %add = add i64 %4, 1, !dbg !186
  %cmp = icmp ult i64 %3, %add, !dbg !187
  br i1 %cmp, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !191
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !191
  %7 = load i8*, i8** %data, align 8, !dbg !192
  %8 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !192
  store i8 %6, i8* %arrayidx3, align 1, !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !196
  %inc = add i64 %9, 1, !dbg !196
  store i64 %inc, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !200
  call void @printLine(i8* %10), !dbg !201
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 30, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 31, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_05_bad", scope: !10, file: !10, line: 35, type: !19, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 37, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 37, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 38, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 80, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 38, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 39, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 39, column: 10, scope: !18)
!35 = !DILocation(line: 40, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !10, line: 40, column: 8)
!37 = !DILocation(line: 40, column: 8, scope: !18)
!38 = !DILocation(line: 44, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 41, column: 5)
!40 = !DILocation(line: 44, column: 14, scope: !39)
!41 = !DILocation(line: 45, column: 9, scope: !39)
!42 = !DILocation(line: 45, column: 17, scope: !39)
!43 = !DILocation(line: 46, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !10, line: 48, type: !31)
!45 = distinct !DILexicalBlock(scope: !18, file: !10, line: 47, column: 5)
!46 = !DILocation(line: 48, column: 14, scope: !45)
!47 = !DILocalVariable(name: "i", scope: !45, file: !10, line: 49, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 49, column: 16, scope: !45)
!52 = !DILocalVariable(name: "sourceLen", scope: !45, file: !10, line: 49, type: !48)
!53 = !DILocation(line: 49, column: 19, scope: !45)
!54 = !DILocation(line: 50, column: 28, scope: !45)
!55 = !DILocation(line: 50, column: 21, scope: !45)
!56 = !DILocation(line: 50, column: 19, scope: !45)
!57 = !DILocation(line: 53, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !45, file: !10, line: 53, column: 9)
!59 = !DILocation(line: 53, column: 14, scope: !58)
!60 = !DILocation(line: 53, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !10, line: 53, column: 9)
!62 = !DILocation(line: 53, column: 25, scope: !61)
!63 = !DILocation(line: 53, column: 35, scope: !61)
!64 = !DILocation(line: 53, column: 23, scope: !61)
!65 = !DILocation(line: 53, column: 9, scope: !58)
!66 = !DILocation(line: 55, column: 30, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !10, line: 54, column: 9)
!68 = !DILocation(line: 55, column: 23, scope: !67)
!69 = !DILocation(line: 55, column: 13, scope: !67)
!70 = !DILocation(line: 55, column: 18, scope: !67)
!71 = !DILocation(line: 55, column: 21, scope: !67)
!72 = !DILocation(line: 56, column: 9, scope: !67)
!73 = !DILocation(line: 53, column: 41, scope: !61)
!74 = !DILocation(line: 53, column: 9, scope: !61)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 56, column: 9, scope: !58)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 57, column: 19, scope: !45)
!79 = !DILocation(line: 57, column: 9, scope: !45)
!80 = !DILocation(line: 59, column: 1, scope: !18)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_05_good", scope: !10, file: !10, line: 124, type: !19, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 126, column: 5, scope: !81)
!83 = !DILocation(line: 127, column: 5, scope: !81)
!84 = !DILocation(line: 128, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 140, type: !86, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!11, !11, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !10, line: 140, type: !11)
!90 = !DILocation(line: 140, column: 14, scope: !85)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !10, line: 140, type: !88)
!92 = !DILocation(line: 140, column: 27, scope: !85)
!93 = !DILocation(line: 143, column: 22, scope: !85)
!94 = !DILocation(line: 143, column: 12, scope: !85)
!95 = !DILocation(line: 143, column: 5, scope: !85)
!96 = !DILocation(line: 145, column: 5, scope: !85)
!97 = !DILocation(line: 146, column: 5, scope: !85)
!98 = !DILocation(line: 147, column: 5, scope: !85)
!99 = !DILocation(line: 150, column: 5, scope: !85)
!100 = !DILocation(line: 151, column: 5, scope: !85)
!101 = !DILocation(line: 152, column: 5, scope: !85)
!102 = !DILocation(line: 154, column: 5, scope: !85)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 66, type: !19, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !10, line: 68, type: !22)
!105 = !DILocation(line: 68, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !10, line: 69, type: !26)
!107 = !DILocation(line: 69, column: 10, scope: !103)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !10, line: 70, type: !31)
!109 = !DILocation(line: 70, column: 10, scope: !103)
!110 = !DILocation(line: 71, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !10, line: 71, column: 8)
!112 = !DILocation(line: 71, column: 8, scope: !103)
!113 = !DILocation(line: 74, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !10, line: 72, column: 5)
!115 = !DILocation(line: 75, column: 5, scope: !114)
!116 = !DILocation(line: 80, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !10, line: 77, column: 5)
!118 = !DILocation(line: 80, column: 14, scope: !117)
!119 = !DILocation(line: 81, column: 9, scope: !117)
!120 = !DILocation(line: 81, column: 17, scope: !117)
!121 = !DILocalVariable(name: "source", scope: !122, file: !10, line: 84, type: !31)
!122 = distinct !DILexicalBlock(scope: !103, file: !10, line: 83, column: 5)
!123 = !DILocation(line: 84, column: 14, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !10, line: 85, type: !48)
!125 = !DILocation(line: 85, column: 16, scope: !122)
!126 = !DILocalVariable(name: "sourceLen", scope: !122, file: !10, line: 85, type: !48)
!127 = !DILocation(line: 85, column: 19, scope: !122)
!128 = !DILocation(line: 86, column: 28, scope: !122)
!129 = !DILocation(line: 86, column: 21, scope: !122)
!130 = !DILocation(line: 86, column: 19, scope: !122)
!131 = !DILocation(line: 89, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !122, file: !10, line: 89, column: 9)
!133 = !DILocation(line: 89, column: 14, scope: !132)
!134 = !DILocation(line: 89, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !10, line: 89, column: 9)
!136 = !DILocation(line: 89, column: 25, scope: !135)
!137 = !DILocation(line: 89, column: 35, scope: !135)
!138 = !DILocation(line: 89, column: 23, scope: !135)
!139 = !DILocation(line: 89, column: 9, scope: !132)
!140 = !DILocation(line: 91, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !10, line: 90, column: 9)
!142 = !DILocation(line: 91, column: 23, scope: !141)
!143 = !DILocation(line: 91, column: 13, scope: !141)
!144 = !DILocation(line: 91, column: 18, scope: !141)
!145 = !DILocation(line: 91, column: 21, scope: !141)
!146 = !DILocation(line: 92, column: 9, scope: !141)
!147 = !DILocation(line: 89, column: 41, scope: !135)
!148 = !DILocation(line: 89, column: 9, scope: !135)
!149 = distinct !{!149, !139, !150, !77}
!150 = !DILocation(line: 92, column: 9, scope: !132)
!151 = !DILocation(line: 93, column: 19, scope: !122)
!152 = !DILocation(line: 93, column: 9, scope: !122)
!153 = !DILocation(line: 95, column: 1, scope: !103)
!154 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 98, type: !19, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!155 = !DILocalVariable(name: "data", scope: !154, file: !10, line: 100, type: !22)
!156 = !DILocation(line: 100, column: 12, scope: !154)
!157 = !DILocalVariable(name: "dataBadBuffer", scope: !154, file: !10, line: 101, type: !26)
!158 = !DILocation(line: 101, column: 10, scope: !154)
!159 = !DILocalVariable(name: "dataGoodBuffer", scope: !154, file: !10, line: 102, type: !31)
!160 = !DILocation(line: 102, column: 10, scope: !154)
!161 = !DILocation(line: 103, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !154, file: !10, line: 103, column: 8)
!163 = !DILocation(line: 103, column: 8, scope: !154)
!164 = !DILocation(line: 107, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !10, line: 104, column: 5)
!166 = !DILocation(line: 107, column: 14, scope: !165)
!167 = !DILocation(line: 108, column: 9, scope: !165)
!168 = !DILocation(line: 108, column: 17, scope: !165)
!169 = !DILocation(line: 109, column: 5, scope: !165)
!170 = !DILocalVariable(name: "source", scope: !171, file: !10, line: 111, type: !31)
!171 = distinct !DILexicalBlock(scope: !154, file: !10, line: 110, column: 5)
!172 = !DILocation(line: 111, column: 14, scope: !171)
!173 = !DILocalVariable(name: "i", scope: !171, file: !10, line: 112, type: !48)
!174 = !DILocation(line: 112, column: 16, scope: !171)
!175 = !DILocalVariable(name: "sourceLen", scope: !171, file: !10, line: 112, type: !48)
!176 = !DILocation(line: 112, column: 19, scope: !171)
!177 = !DILocation(line: 113, column: 28, scope: !171)
!178 = !DILocation(line: 113, column: 21, scope: !171)
!179 = !DILocation(line: 113, column: 19, scope: !171)
!180 = !DILocation(line: 116, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !171, file: !10, line: 116, column: 9)
!182 = !DILocation(line: 116, column: 14, scope: !181)
!183 = !DILocation(line: 116, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !10, line: 116, column: 9)
!185 = !DILocation(line: 116, column: 25, scope: !184)
!186 = !DILocation(line: 116, column: 35, scope: !184)
!187 = !DILocation(line: 116, column: 23, scope: !184)
!188 = !DILocation(line: 116, column: 9, scope: !181)
!189 = !DILocation(line: 118, column: 30, scope: !190)
!190 = distinct !DILexicalBlock(scope: !184, file: !10, line: 117, column: 9)
!191 = !DILocation(line: 118, column: 23, scope: !190)
!192 = !DILocation(line: 118, column: 13, scope: !190)
!193 = !DILocation(line: 118, column: 18, scope: !190)
!194 = !DILocation(line: 118, column: 21, scope: !190)
!195 = !DILocation(line: 119, column: 9, scope: !190)
!196 = !DILocation(line: 116, column: 41, scope: !184)
!197 = !DILocation(line: 116, column: 9, scope: !184)
!198 = distinct !{!198, !188, !199, !77}
!199 = !DILocation(line: 119, column: 9, scope: !181)
!200 = !DILocation(line: 120, column: 19, scope: !171)
!201 = !DILocation(line: 120, column: 9, scope: !171)
!202 = !DILocation(line: 122, column: 1, scope: !154)
