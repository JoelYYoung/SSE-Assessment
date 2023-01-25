; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 50, align 16, !dbg !25
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = alloca i8, i64 100, align 16, !dbg !28
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !27
  %2 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp = icmp eq i32 %2, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %3, i8** %data, align 8, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !45, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx1, align 1, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !56
  %cmp2 = icmp ult i64 %5, 100, !dbg !58
  br i1 %cmp2, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !62
  %7 = load i8, i8* %arrayidx3, align 1, !dbg !62
  %8 = load i8*, i8** %data, align 8, !dbg !63
  %9 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !63
  store i8 %7, i8* %arrayidx4, align 1, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %10, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !72
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !72
  store i8 0, i8* %arrayidx5, align 1, !dbg !73
  %12 = load i8*, i8** %data, align 8, !dbg !74
  call void @printLine(i8* %12), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_07_good() #0 !dbg !77 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #5, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #5, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_07_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_07_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 50, align 16, !dbg !104
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %1 = alloca i8, i64 100, align 16, !dbg !107
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !106
  %2 = load i32, i32* @staticFive, align 4, !dbg !108
  %cmp = icmp ne i32 %2, 5, !dbg !110
  br i1 %cmp, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !115
  store i8* %3, i8** %data, align 8, !dbg !117
  %4 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx1, align 1, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !131
  %cmp2 = icmp ult i64 %5, 100, !dbg !133
  br i1 %cmp2, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !137
  %7 = load i8, i8* %arrayidx3, align 1, !dbg !137
  %8 = load i8*, i8** %data, align 8, !dbg !138
  %9 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !138
  store i8 %7, i8* %arrayidx4, align 1, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %10, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !146
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !146
  store i8 0, i8* %arrayidx5, align 1, !dbg !147
  %12 = load i8*, i8** %data, align 8, !dbg !148
  call void @printLine(i8* %12), !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  %0 = alloca i8, i64 50, align 16, !dbg !156
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !155
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  %1 = alloca i8, i64 100, align 16, !dbg !159
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !158
  %2 = load i32, i32* @staticFive, align 4, !dbg !160
  %cmp = icmp eq i32 %2, 5, !dbg !162
  br i1 %cmp, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !164
  store i8* %3, i8** %data, align 8, !dbg !166
  %4 = load i8*, i8** %data, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !173, metadata !DIExpression()), !dbg !174
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !175
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !176
  store i8 0, i8* %arrayidx1, align 1, !dbg !177
  store i64 0, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !180

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !181
  %cmp2 = icmp ult i64 %5, 100, !dbg !183
  br i1 %cmp2, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !187
  %7 = load i8, i8* %arrayidx3, align 1, !dbg !187
  %8 = load i8*, i8** %data, align 8, !dbg !188
  %9 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !188
  store i8 %7, i8* %arrayidx4, align 1, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !192
  %inc = add i64 %10, 1, !dbg !192
  store i64 %inc, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !196
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !196
  store i8 0, i8* %arrayidx5, align 1, !dbg !197
  %12 = load i8*, i8** %data, align 8, !dbg !198
  call void @printLine(i8* %12), !dbg !199
  ret void, !dbg !200
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_07_bad", scope: !10, file: !10, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 31, type: !6)
!22 = !DILocation(line: 31, column: 12, scope: !18)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocation(line: 32, column: 36, scope: !18)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 12, scope: !18)
!28 = !DILocation(line: 33, column: 37, scope: !18)
!29 = !DILocation(line: 34, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !10, line: 34, column: 8)
!31 = !DILocation(line: 34, column: 18, scope: !30)
!32 = !DILocation(line: 34, column: 8, scope: !18)
!33 = !DILocation(line: 38, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 35, column: 5)
!35 = !DILocation(line: 38, column: 14, scope: !34)
!36 = !DILocation(line: 39, column: 9, scope: !34)
!37 = !DILocation(line: 39, column: 17, scope: !34)
!38 = !DILocation(line: 40, column: 5, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !40, file: !10, line: 42, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 42, column: 16, scope: !40)
!45 = !DILocalVariable(name: "source", scope: !40, file: !10, line: 43, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 43, column: 14, scope: !40)
!50 = !DILocation(line: 44, column: 9, scope: !40)
!51 = !DILocation(line: 45, column: 9, scope: !40)
!52 = !DILocation(line: 45, column: 23, scope: !40)
!53 = !DILocation(line: 47, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !40, file: !10, line: 47, column: 9)
!55 = !DILocation(line: 47, column: 14, scope: !54)
!56 = !DILocation(line: 47, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !10, line: 47, column: 9)
!58 = !DILocation(line: 47, column: 23, scope: !57)
!59 = !DILocation(line: 47, column: 9, scope: !54)
!60 = !DILocation(line: 49, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !10, line: 48, column: 9)
!62 = !DILocation(line: 49, column: 23, scope: !61)
!63 = !DILocation(line: 49, column: 13, scope: !61)
!64 = !DILocation(line: 49, column: 18, scope: !61)
!65 = !DILocation(line: 49, column: 21, scope: !61)
!66 = !DILocation(line: 50, column: 9, scope: !61)
!67 = !DILocation(line: 47, column: 31, scope: !57)
!68 = !DILocation(line: 47, column: 9, scope: !57)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 50, column: 9, scope: !54)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 51, column: 9, scope: !40)
!73 = !DILocation(line: 51, column: 21, scope: !40)
!74 = !DILocation(line: 52, column: 19, scope: !40)
!75 = !DILocation(line: 52, column: 9, scope: !40)
!76 = !DILocation(line: 54, column: 1, scope: !18)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_07_good", scope: !10, file: !10, line: 119, type: !19, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 121, column: 5, scope: !77)
!79 = !DILocation(line: 122, column: 5, scope: !77)
!80 = !DILocation(line: 123, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 135, type: !82, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DISubroutineType(types: !83)
!83 = !{!11, !11, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !10, line: 135, type: !11)
!86 = !DILocation(line: 135, column: 14, scope: !81)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !10, line: 135, type: !84)
!88 = !DILocation(line: 135, column: 27, scope: !81)
!89 = !DILocation(line: 138, column: 22, scope: !81)
!90 = !DILocation(line: 138, column: 12, scope: !81)
!91 = !DILocation(line: 138, column: 5, scope: !81)
!92 = !DILocation(line: 140, column: 5, scope: !81)
!93 = !DILocation(line: 141, column: 5, scope: !81)
!94 = !DILocation(line: 142, column: 5, scope: !81)
!95 = !DILocation(line: 145, column: 5, scope: !81)
!96 = !DILocation(line: 146, column: 5, scope: !81)
!97 = !DILocation(line: 147, column: 5, scope: !81)
!98 = !DILocation(line: 149, column: 5, scope: !81)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !10, line: 63, type: !6)
!101 = !DILocation(line: 63, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !10, line: 64, type: !6)
!103 = !DILocation(line: 64, column: 12, scope: !99)
!104 = !DILocation(line: 64, column: 36, scope: !99)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !10, line: 65, type: !6)
!106 = !DILocation(line: 65, column: 12, scope: !99)
!107 = !DILocation(line: 65, column: 37, scope: !99)
!108 = !DILocation(line: 66, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !99, file: !10, line: 66, column: 8)
!110 = !DILocation(line: 66, column: 18, scope: !109)
!111 = !DILocation(line: 66, column: 8, scope: !99)
!112 = !DILocation(line: 69, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !10, line: 67, column: 5)
!114 = !DILocation(line: 70, column: 5, scope: !113)
!115 = !DILocation(line: 74, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !109, file: !10, line: 72, column: 5)
!117 = !DILocation(line: 74, column: 14, scope: !116)
!118 = !DILocation(line: 75, column: 9, scope: !116)
!119 = !DILocation(line: 75, column: 17, scope: !116)
!120 = !DILocalVariable(name: "i", scope: !121, file: !10, line: 78, type: !41)
!121 = distinct !DILexicalBlock(scope: !99, file: !10, line: 77, column: 5)
!122 = !DILocation(line: 78, column: 16, scope: !121)
!123 = !DILocalVariable(name: "source", scope: !121, file: !10, line: 79, type: !46)
!124 = !DILocation(line: 79, column: 14, scope: !121)
!125 = !DILocation(line: 80, column: 9, scope: !121)
!126 = !DILocation(line: 81, column: 9, scope: !121)
!127 = !DILocation(line: 81, column: 23, scope: !121)
!128 = !DILocation(line: 83, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !121, file: !10, line: 83, column: 9)
!130 = !DILocation(line: 83, column: 14, scope: !129)
!131 = !DILocation(line: 83, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !10, line: 83, column: 9)
!133 = !DILocation(line: 83, column: 23, scope: !132)
!134 = !DILocation(line: 83, column: 9, scope: !129)
!135 = !DILocation(line: 85, column: 30, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !10, line: 84, column: 9)
!137 = !DILocation(line: 85, column: 23, scope: !136)
!138 = !DILocation(line: 85, column: 13, scope: !136)
!139 = !DILocation(line: 85, column: 18, scope: !136)
!140 = !DILocation(line: 85, column: 21, scope: !136)
!141 = !DILocation(line: 86, column: 9, scope: !136)
!142 = !DILocation(line: 83, column: 31, scope: !132)
!143 = !DILocation(line: 83, column: 9, scope: !132)
!144 = distinct !{!144, !134, !145, !71}
!145 = !DILocation(line: 86, column: 9, scope: !129)
!146 = !DILocation(line: 87, column: 9, scope: !121)
!147 = !DILocation(line: 87, column: 21, scope: !121)
!148 = !DILocation(line: 88, column: 19, scope: !121)
!149 = !DILocation(line: 88, column: 9, scope: !121)
!150 = !DILocation(line: 90, column: 1, scope: !99)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 93, type: !19, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!152 = !DILocalVariable(name: "data", scope: !151, file: !10, line: 95, type: !6)
!153 = !DILocation(line: 95, column: 12, scope: !151)
!154 = !DILocalVariable(name: "dataBadBuffer", scope: !151, file: !10, line: 96, type: !6)
!155 = !DILocation(line: 96, column: 12, scope: !151)
!156 = !DILocation(line: 96, column: 36, scope: !151)
!157 = !DILocalVariable(name: "dataGoodBuffer", scope: !151, file: !10, line: 97, type: !6)
!158 = !DILocation(line: 97, column: 12, scope: !151)
!159 = !DILocation(line: 97, column: 37, scope: !151)
!160 = !DILocation(line: 98, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !151, file: !10, line: 98, column: 8)
!162 = !DILocation(line: 98, column: 18, scope: !161)
!163 = !DILocation(line: 98, column: 8, scope: !151)
!164 = !DILocation(line: 101, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !10, line: 99, column: 5)
!166 = !DILocation(line: 101, column: 14, scope: !165)
!167 = !DILocation(line: 102, column: 9, scope: !165)
!168 = !DILocation(line: 102, column: 17, scope: !165)
!169 = !DILocation(line: 103, column: 5, scope: !165)
!170 = !DILocalVariable(name: "i", scope: !171, file: !10, line: 105, type: !41)
!171 = distinct !DILexicalBlock(scope: !151, file: !10, line: 104, column: 5)
!172 = !DILocation(line: 105, column: 16, scope: !171)
!173 = !DILocalVariable(name: "source", scope: !171, file: !10, line: 106, type: !46)
!174 = !DILocation(line: 106, column: 14, scope: !171)
!175 = !DILocation(line: 107, column: 9, scope: !171)
!176 = !DILocation(line: 108, column: 9, scope: !171)
!177 = !DILocation(line: 108, column: 23, scope: !171)
!178 = !DILocation(line: 110, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !171, file: !10, line: 110, column: 9)
!180 = !DILocation(line: 110, column: 14, scope: !179)
!181 = !DILocation(line: 110, column: 21, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !10, line: 110, column: 9)
!183 = !DILocation(line: 110, column: 23, scope: !182)
!184 = !DILocation(line: 110, column: 9, scope: !179)
!185 = !DILocation(line: 112, column: 30, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !10, line: 111, column: 9)
!187 = !DILocation(line: 112, column: 23, scope: !186)
!188 = !DILocation(line: 112, column: 13, scope: !186)
!189 = !DILocation(line: 112, column: 18, scope: !186)
!190 = !DILocation(line: 112, column: 21, scope: !186)
!191 = !DILocation(line: 113, column: 9, scope: !186)
!192 = !DILocation(line: 110, column: 31, scope: !182)
!193 = !DILocation(line: 110, column: 9, scope: !182)
!194 = distinct !{!194, !184, !195, !71}
!195 = !DILocation(line: 113, column: 9, scope: !179)
!196 = !DILocation(line: 114, column: 9, scope: !171)
!197 = !DILocation(line: 114, column: 21, scope: !171)
!198 = !DILocation(line: 115, column: 19, scope: !171)
!199 = !DILocation(line: 115, column: 9, scope: !171)
!200 = !DILocation(line: 117, column: 1, scope: !151)
