; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %0, i8** %dataBuffer, align 8, !dbg !26
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  store i8* %1, i8** %data, align 8, !dbg !29
  %2 = load i32, i32* @staticTrue, align 4, !dbg !30
  %tobool = icmp ne i32 %2, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !50, metadata !DIExpression()), !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  %call = call i64 @strlen(i8* %6) #6, !dbg !53
  store i64 %call, i64* %dataLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !58
  %8 = load i64, i64* %dataLen, align 8, !dbg !60
  %cmp = icmp ult i64 %7, %8, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !63
  %10 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx1 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !63
  %11 = load i8, i8* %arrayidx1, align 1, !dbg !63
  %12 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !67
  store i8 %11, i8* %arrayidx2, align 1, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %13, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !75
  store i8 0, i8* %arrayidx3, align 1, !dbg !76
  %14 = load i8*, i8** %data, align 8, !dbg !77
  call void @printLine(i8* %14), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_05_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_05_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_05_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 100, align 16, !dbg !107
  store i8* %0, i8** %dataBuffer, align 8, !dbg !106
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  store i8* %1, i8** %data, align 8, !dbg !109
  %2 = load i32, i32* @staticFalse, align 4, !dbg !110
  %tobool = icmp ne i32 %2, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !118
  %4 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !126, metadata !DIExpression()), !dbg !127
  %6 = load i8*, i8** %data, align 8, !dbg !128
  %call = call i64 @strlen(i8* %6) #6, !dbg !129
  store i64 %call, i64* %dataLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !134
  %8 = load i64, i64* %dataLen, align 8, !dbg !136
  %cmp = icmp ult i64 %7, %8, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !139
  %10 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx1 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !139
  %11 = load i8, i8* %arrayidx1, align 1, !dbg !139
  %12 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !143
  store i8 %11, i8* %arrayidx2, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %13, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !150
  store i8 0, i8* %arrayidx3, align 1, !dbg !151
  %14 = load i8*, i8** %data, align 8, !dbg !152
  call void @printLine(i8* %14), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !155 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  %0 = alloca i8, i64 100, align 16, !dbg !160
  store i8* %0, i8** %dataBuffer, align 8, !dbg !159
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !161
  store i8* %1, i8** %data, align 8, !dbg !162
  %2 = load i32, i32* @staticTrue, align 4, !dbg !163
  %tobool = icmp ne i32 %2, 0, !dbg !163
  br i1 %tobool, label %if.then, label %if.end, !dbg !165

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !168
  %4 = load i8*, i8** %data, align 8, !dbg !169
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !169
  store i8 0, i8* %arrayidx, align 1, !dbg !170
  br label %if.end, !dbg !171

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !172, metadata !DIExpression()), !dbg !174
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %i, metadata !175, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !177, metadata !DIExpression()), !dbg !178
  %6 = load i8*, i8** %data, align 8, !dbg !179
  %call = call i64 @strlen(i8* %6) #6, !dbg !180
  store i64 %call, i64* %dataLen, align 8, !dbg !181
  store i64 0, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !185
  %8 = load i64, i64* %dataLen, align 8, !dbg !187
  %cmp = icmp ult i64 %7, %8, !dbg !188
  br i1 %cmp, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !190
  %10 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx1 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !190
  %11 = load i8, i8* %arrayidx1, align 1, !dbg !190
  %12 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !194
  store i8 %11, i8* %arrayidx2, align 1, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !197
  %inc = add i64 %13, 1, !dbg !197
  store i64 %inc, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !201
  store i8 0, i8* %arrayidx3, align 1, !dbg !202
  %14 = load i8*, i8** %data, align 8, !dbg !203
  call void @printLine(i8* %14), !dbg !204
  ret void, !dbg !205
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !12, line: 33, type: !6)
!26 = !DILocation(line: 33, column: 12, scope: !20)
!27 = !DILocation(line: 33, column: 33, scope: !20)
!28 = !DILocation(line: 34, column: 12, scope: !20)
!29 = !DILocation(line: 34, column: 10, scope: !20)
!30 = !DILocation(line: 35, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !12, line: 35, column: 8)
!32 = !DILocation(line: 35, column: 8, scope: !20)
!33 = !DILocation(line: 38, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 36, column: 5)
!35 = !DILocation(line: 38, column: 9, scope: !34)
!36 = !DILocation(line: 39, column: 9, scope: !34)
!37 = !DILocation(line: 39, column: 21, scope: !34)
!38 = !DILocation(line: 40, column: 5, scope: !34)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !12, line: 42, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !12, line: 41, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 42, column: 14, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !12, line: 43, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 43, column: 16, scope: !40)
!50 = !DILocalVariable(name: "dataLen", scope: !40, file: !12, line: 43, type: !46)
!51 = !DILocation(line: 43, column: 19, scope: !40)
!52 = !DILocation(line: 44, column: 26, scope: !40)
!53 = !DILocation(line: 44, column: 19, scope: !40)
!54 = !DILocation(line: 44, column: 17, scope: !40)
!55 = !DILocation(line: 46, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !40, file: !12, line: 46, column: 9)
!57 = !DILocation(line: 46, column: 14, scope: !56)
!58 = !DILocation(line: 46, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 46, column: 9)
!60 = !DILocation(line: 46, column: 25, scope: !59)
!61 = !DILocation(line: 46, column: 23, scope: !59)
!62 = !DILocation(line: 46, column: 9, scope: !56)
!63 = !DILocation(line: 48, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !12, line: 47, column: 9)
!65 = !DILocation(line: 48, column: 28, scope: !64)
!66 = !DILocation(line: 48, column: 18, scope: !64)
!67 = !DILocation(line: 48, column: 13, scope: !64)
!68 = !DILocation(line: 48, column: 21, scope: !64)
!69 = !DILocation(line: 49, column: 9, scope: !64)
!70 = !DILocation(line: 46, column: 35, scope: !59)
!71 = !DILocation(line: 46, column: 9, scope: !59)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 49, column: 9, scope: !56)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 50, column: 9, scope: !40)
!76 = !DILocation(line: 50, column: 20, scope: !40)
!77 = !DILocation(line: 51, column: 19, scope: !40)
!78 = !DILocation(line: 51, column: 9, scope: !40)
!79 = !DILocation(line: 53, column: 1, scope: !20)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_05_good", scope: !12, file: !12, line: 116, type: !21, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 118, column: 5, scope: !80)
!82 = !DILocation(line: 119, column: 5, scope: !80)
!83 = !DILocation(line: 120, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 132, type: !85, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DISubroutineType(types: !86)
!86 = !{!13, !13, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 132, type: !13)
!89 = !DILocation(line: 132, column: 14, scope: !84)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 132, type: !87)
!91 = !DILocation(line: 132, column: 27, scope: !84)
!92 = !DILocation(line: 135, column: 22, scope: !84)
!93 = !DILocation(line: 135, column: 12, scope: !84)
!94 = !DILocation(line: 135, column: 5, scope: !84)
!95 = !DILocation(line: 137, column: 5, scope: !84)
!96 = !DILocation(line: 138, column: 5, scope: !84)
!97 = !DILocation(line: 139, column: 5, scope: !84)
!98 = !DILocation(line: 142, column: 5, scope: !84)
!99 = !DILocation(line: 143, column: 5, scope: !84)
!100 = !DILocation(line: 144, column: 5, scope: !84)
!101 = !DILocation(line: 146, column: 5, scope: !84)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 62, type: !6)
!104 = !DILocation(line: 62, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !12, line: 63, type: !6)
!106 = !DILocation(line: 63, column: 12, scope: !102)
!107 = !DILocation(line: 63, column: 33, scope: !102)
!108 = !DILocation(line: 64, column: 12, scope: !102)
!109 = !DILocation(line: 64, column: 10, scope: !102)
!110 = !DILocation(line: 65, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !102, file: !12, line: 65, column: 8)
!112 = !DILocation(line: 65, column: 8, scope: !102)
!113 = !DILocation(line: 68, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 66, column: 5)
!115 = !DILocation(line: 69, column: 5, scope: !114)
!116 = !DILocation(line: 73, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !12, line: 71, column: 5)
!118 = !DILocation(line: 73, column: 9, scope: !117)
!119 = !DILocation(line: 74, column: 9, scope: !117)
!120 = !DILocation(line: 74, column: 20, scope: !117)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !12, line: 77, type: !41)
!122 = distinct !DILexicalBlock(scope: !102, file: !12, line: 76, column: 5)
!123 = !DILocation(line: 77, column: 14, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !12, line: 78, type: !46)
!125 = !DILocation(line: 78, column: 16, scope: !122)
!126 = !DILocalVariable(name: "dataLen", scope: !122, file: !12, line: 78, type: !46)
!127 = !DILocation(line: 78, column: 19, scope: !122)
!128 = !DILocation(line: 79, column: 26, scope: !122)
!129 = !DILocation(line: 79, column: 19, scope: !122)
!130 = !DILocation(line: 79, column: 17, scope: !122)
!131 = !DILocation(line: 81, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !122, file: !12, line: 81, column: 9)
!133 = !DILocation(line: 81, column: 14, scope: !132)
!134 = !DILocation(line: 81, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !12, line: 81, column: 9)
!136 = !DILocation(line: 81, column: 25, scope: !135)
!137 = !DILocation(line: 81, column: 23, scope: !135)
!138 = !DILocation(line: 81, column: 9, scope: !132)
!139 = !DILocation(line: 83, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !12, line: 82, column: 9)
!141 = !DILocation(line: 83, column: 28, scope: !140)
!142 = !DILocation(line: 83, column: 18, scope: !140)
!143 = !DILocation(line: 83, column: 13, scope: !140)
!144 = !DILocation(line: 83, column: 21, scope: !140)
!145 = !DILocation(line: 84, column: 9, scope: !140)
!146 = !DILocation(line: 81, column: 35, scope: !135)
!147 = !DILocation(line: 81, column: 9, scope: !135)
!148 = distinct !{!148, !138, !149, !74}
!149 = !DILocation(line: 84, column: 9, scope: !132)
!150 = !DILocation(line: 85, column: 9, scope: !122)
!151 = !DILocation(line: 85, column: 20, scope: !122)
!152 = !DILocation(line: 86, column: 19, scope: !122)
!153 = !DILocation(line: 86, column: 9, scope: !122)
!154 = !DILocation(line: 88, column: 1, scope: !102)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !21, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DILocalVariable(name: "data", scope: !155, file: !12, line: 93, type: !6)
!157 = !DILocation(line: 93, column: 12, scope: !155)
!158 = !DILocalVariable(name: "dataBuffer", scope: !155, file: !12, line: 94, type: !6)
!159 = !DILocation(line: 94, column: 12, scope: !155)
!160 = !DILocation(line: 94, column: 33, scope: !155)
!161 = !DILocation(line: 95, column: 12, scope: !155)
!162 = !DILocation(line: 95, column: 10, scope: !155)
!163 = !DILocation(line: 96, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !155, file: !12, line: 96, column: 8)
!165 = !DILocation(line: 96, column: 8, scope: !155)
!166 = !DILocation(line: 99, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !12, line: 97, column: 5)
!168 = !DILocation(line: 99, column: 9, scope: !167)
!169 = !DILocation(line: 100, column: 9, scope: !167)
!170 = !DILocation(line: 100, column: 20, scope: !167)
!171 = !DILocation(line: 101, column: 5, scope: !167)
!172 = !DILocalVariable(name: "dest", scope: !173, file: !12, line: 103, type: !41)
!173 = distinct !DILexicalBlock(scope: !155, file: !12, line: 102, column: 5)
!174 = !DILocation(line: 103, column: 14, scope: !173)
!175 = !DILocalVariable(name: "i", scope: !173, file: !12, line: 104, type: !46)
!176 = !DILocation(line: 104, column: 16, scope: !173)
!177 = !DILocalVariable(name: "dataLen", scope: !173, file: !12, line: 104, type: !46)
!178 = !DILocation(line: 104, column: 19, scope: !173)
!179 = !DILocation(line: 105, column: 26, scope: !173)
!180 = !DILocation(line: 105, column: 19, scope: !173)
!181 = !DILocation(line: 105, column: 17, scope: !173)
!182 = !DILocation(line: 107, column: 16, scope: !183)
!183 = distinct !DILexicalBlock(scope: !173, file: !12, line: 107, column: 9)
!184 = !DILocation(line: 107, column: 14, scope: !183)
!185 = !DILocation(line: 107, column: 21, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !12, line: 107, column: 9)
!187 = !DILocation(line: 107, column: 25, scope: !186)
!188 = !DILocation(line: 107, column: 23, scope: !186)
!189 = !DILocation(line: 107, column: 9, scope: !183)
!190 = !DILocation(line: 109, column: 23, scope: !191)
!191 = distinct !DILexicalBlock(scope: !186, file: !12, line: 108, column: 9)
!192 = !DILocation(line: 109, column: 28, scope: !191)
!193 = !DILocation(line: 109, column: 18, scope: !191)
!194 = !DILocation(line: 109, column: 13, scope: !191)
!195 = !DILocation(line: 109, column: 21, scope: !191)
!196 = !DILocation(line: 110, column: 9, scope: !191)
!197 = !DILocation(line: 107, column: 35, scope: !186)
!198 = !DILocation(line: 107, column: 9, scope: !186)
!199 = distinct !{!199, !189, !200, !74}
!200 = !DILocation(line: 110, column: 9, scope: !183)
!201 = !DILocation(line: 111, column: 9, scope: !173)
!202 = !DILocation(line: 111, column: 20, scope: !173)
!203 = !DILocation(line: 112, column: 19, scope: !173)
!204 = !DILocation(line: 112, column: 9, scope: !173)
!205 = !DILocation(line: 114, column: 1, scope: !155)
