; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_05.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 50, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 100, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %2, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !34
  store i8* %3, i8** %data, align 8, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx1, align 1, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !57
  %cmp = icmp ult i64 %5, 100, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !63
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !63
  %8 = load i8*, i8** %data, align 8, !dbg !64
  %9 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !64
  store i8 %7, i8* %arrayidx3, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %10, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !73
  %arrayidx4 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !73
  store i8 0, i8* %arrayidx4, align 1, !dbg !74
  %12 = load i8*, i8** %data, align 8, !dbg !75
  call void @printLine(i8* %12), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_05_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #5, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #5, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_05_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_05_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 50, align 16, !dbg !105
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %1 = alloca i8, i64 100, align 16, !dbg !108
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !107
  %2 = load i32, i32* @staticFalse, align 4, !dbg !109
  %tobool = icmp ne i32 %2, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

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
  %cmp = icmp ult i64 %5, 100, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !137
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !137
  %8 = load i8*, i8** %data, align 8, !dbg !138
  %9 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !138
  store i8 %7, i8* %arrayidx3, align 1, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %10, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !146
  %arrayidx4 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !146
  store i8 0, i8* %arrayidx4, align 1, !dbg !147
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
  %2 = load i32, i32* @staticTrue, align 4, !dbg !160
  %tobool = icmp ne i32 %2, 0, !dbg !160
  br i1 %tobool, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !163
  store i8* %3, i8** %data, align 8, !dbg !165
  %4 = load i8*, i8** %data, align 8, !dbg !166
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !166
  store i8 0, i8* %arrayidx, align 1, !dbg !167
  br label %if.end, !dbg !168

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !169, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !172, metadata !DIExpression()), !dbg !173
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !174
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !175
  store i8 0, i8* %arrayidx1, align 1, !dbg !176
  store i64 0, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !180
  %cmp = icmp ult i64 %5, 100, !dbg !182
  br i1 %cmp, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !186
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !186
  %8 = load i8*, i8** %data, align 8, !dbg !187
  %9 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !187
  store i8 %7, i8* %arrayidx3, align 1, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !191
  %inc = add i64 %10, 1, !dbg !191
  store i64 %inc, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !195
  %arrayidx4 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !195
  store i8 0, i8* %arrayidx4, align 1, !dbg !196
  %12 = load i8*, i8** %data, align 8, !dbg !197
  call void @printLine(i8* %12), !dbg !198
  ret void, !dbg !199
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_05.c", directory: "/root/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !20, file: !12, line: 33, type: !6)
!26 = !DILocation(line: 33, column: 12, scope: !20)
!27 = !DILocation(line: 33, column: 36, scope: !20)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !20, file: !12, line: 34, type: !6)
!29 = !DILocation(line: 34, column: 12, scope: !20)
!30 = !DILocation(line: 34, column: 37, scope: !20)
!31 = !DILocation(line: 35, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !20, file: !12, line: 35, column: 8)
!33 = !DILocation(line: 35, column: 8, scope: !20)
!34 = !DILocation(line: 39, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 36, column: 5)
!36 = !DILocation(line: 39, column: 14, scope: !35)
!37 = !DILocation(line: 40, column: 9, scope: !35)
!38 = !DILocation(line: 40, column: 17, scope: !35)
!39 = !DILocation(line: 41, column: 5, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 43, type: !42)
!41 = distinct !DILexicalBlock(scope: !20, file: !12, line: 42, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 43, column: 16, scope: !41)
!46 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 44, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 44, column: 14, scope: !41)
!51 = !DILocation(line: 45, column: 9, scope: !41)
!52 = !DILocation(line: 46, column: 9, scope: !41)
!53 = !DILocation(line: 46, column: 23, scope: !41)
!54 = !DILocation(line: 48, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !41, file: !12, line: 48, column: 9)
!56 = !DILocation(line: 48, column: 14, scope: !55)
!57 = !DILocation(line: 48, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 48, column: 9)
!59 = !DILocation(line: 48, column: 23, scope: !58)
!60 = !DILocation(line: 48, column: 9, scope: !55)
!61 = !DILocation(line: 50, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !12, line: 49, column: 9)
!63 = !DILocation(line: 50, column: 23, scope: !62)
!64 = !DILocation(line: 50, column: 13, scope: !62)
!65 = !DILocation(line: 50, column: 18, scope: !62)
!66 = !DILocation(line: 50, column: 21, scope: !62)
!67 = !DILocation(line: 51, column: 9, scope: !62)
!68 = !DILocation(line: 48, column: 31, scope: !58)
!69 = !DILocation(line: 48, column: 9, scope: !58)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 51, column: 9, scope: !55)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 52, column: 9, scope: !41)
!74 = !DILocation(line: 52, column: 21, scope: !41)
!75 = !DILocation(line: 53, column: 19, scope: !41)
!76 = !DILocation(line: 53, column: 9, scope: !41)
!77 = !DILocation(line: 55, column: 1, scope: !20)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_05_good", scope: !12, file: !12, line: 120, type: !21, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 122, column: 5, scope: !78)
!80 = !DILocation(line: 123, column: 5, scope: !78)
!81 = !DILocation(line: 124, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 136, type: !83, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!13, !13, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !12, line: 136, type: !13)
!87 = !DILocation(line: 136, column: 14, scope: !82)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !12, line: 136, type: !85)
!89 = !DILocation(line: 136, column: 27, scope: !82)
!90 = !DILocation(line: 139, column: 22, scope: !82)
!91 = !DILocation(line: 139, column: 12, scope: !82)
!92 = !DILocation(line: 139, column: 5, scope: !82)
!93 = !DILocation(line: 141, column: 5, scope: !82)
!94 = !DILocation(line: 142, column: 5, scope: !82)
!95 = !DILocation(line: 143, column: 5, scope: !82)
!96 = !DILocation(line: 146, column: 5, scope: !82)
!97 = !DILocation(line: 147, column: 5, scope: !82)
!98 = !DILocation(line: 148, column: 5, scope: !82)
!99 = !DILocation(line: 150, column: 5, scope: !82)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 62, type: !21, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 64, type: !6)
!102 = !DILocation(line: 64, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !12, line: 65, type: !6)
!104 = !DILocation(line: 65, column: 12, scope: !100)
!105 = !DILocation(line: 65, column: 36, scope: !100)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !12, line: 66, type: !6)
!107 = !DILocation(line: 66, column: 12, scope: !100)
!108 = !DILocation(line: 66, column: 37, scope: !100)
!109 = !DILocation(line: 67, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !100, file: !12, line: 67, column: 8)
!111 = !DILocation(line: 67, column: 8, scope: !100)
!112 = !DILocation(line: 70, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 68, column: 5)
!114 = !DILocation(line: 71, column: 5, scope: !113)
!115 = !DILocation(line: 75, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !12, line: 73, column: 5)
!117 = !DILocation(line: 75, column: 14, scope: !116)
!118 = !DILocation(line: 76, column: 9, scope: !116)
!119 = !DILocation(line: 76, column: 17, scope: !116)
!120 = !DILocalVariable(name: "i", scope: !121, file: !12, line: 79, type: !42)
!121 = distinct !DILexicalBlock(scope: !100, file: !12, line: 78, column: 5)
!122 = !DILocation(line: 79, column: 16, scope: !121)
!123 = !DILocalVariable(name: "source", scope: !121, file: !12, line: 80, type: !47)
!124 = !DILocation(line: 80, column: 14, scope: !121)
!125 = !DILocation(line: 81, column: 9, scope: !121)
!126 = !DILocation(line: 82, column: 9, scope: !121)
!127 = !DILocation(line: 82, column: 23, scope: !121)
!128 = !DILocation(line: 84, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !121, file: !12, line: 84, column: 9)
!130 = !DILocation(line: 84, column: 14, scope: !129)
!131 = !DILocation(line: 84, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 84, column: 9)
!133 = !DILocation(line: 84, column: 23, scope: !132)
!134 = !DILocation(line: 84, column: 9, scope: !129)
!135 = !DILocation(line: 86, column: 30, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !12, line: 85, column: 9)
!137 = !DILocation(line: 86, column: 23, scope: !136)
!138 = !DILocation(line: 86, column: 13, scope: !136)
!139 = !DILocation(line: 86, column: 18, scope: !136)
!140 = !DILocation(line: 86, column: 21, scope: !136)
!141 = !DILocation(line: 87, column: 9, scope: !136)
!142 = !DILocation(line: 84, column: 31, scope: !132)
!143 = !DILocation(line: 84, column: 9, scope: !132)
!144 = distinct !{!144, !134, !145, !72}
!145 = !DILocation(line: 87, column: 9, scope: !129)
!146 = !DILocation(line: 88, column: 9, scope: !121)
!147 = !DILocation(line: 88, column: 21, scope: !121)
!148 = !DILocation(line: 89, column: 19, scope: !121)
!149 = !DILocation(line: 89, column: 9, scope: !121)
!150 = !DILocation(line: 91, column: 1, scope: !100)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 94, type: !21, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!152 = !DILocalVariable(name: "data", scope: !151, file: !12, line: 96, type: !6)
!153 = !DILocation(line: 96, column: 12, scope: !151)
!154 = !DILocalVariable(name: "dataBadBuffer", scope: !151, file: !12, line: 97, type: !6)
!155 = !DILocation(line: 97, column: 12, scope: !151)
!156 = !DILocation(line: 97, column: 36, scope: !151)
!157 = !DILocalVariable(name: "dataGoodBuffer", scope: !151, file: !12, line: 98, type: !6)
!158 = !DILocation(line: 98, column: 12, scope: !151)
!159 = !DILocation(line: 98, column: 37, scope: !151)
!160 = !DILocation(line: 99, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !151, file: !12, line: 99, column: 8)
!162 = !DILocation(line: 99, column: 8, scope: !151)
!163 = !DILocation(line: 102, column: 16, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !12, line: 100, column: 5)
!165 = !DILocation(line: 102, column: 14, scope: !164)
!166 = !DILocation(line: 103, column: 9, scope: !164)
!167 = !DILocation(line: 103, column: 17, scope: !164)
!168 = !DILocation(line: 104, column: 5, scope: !164)
!169 = !DILocalVariable(name: "i", scope: !170, file: !12, line: 106, type: !42)
!170 = distinct !DILexicalBlock(scope: !151, file: !12, line: 105, column: 5)
!171 = !DILocation(line: 106, column: 16, scope: !170)
!172 = !DILocalVariable(name: "source", scope: !170, file: !12, line: 107, type: !47)
!173 = !DILocation(line: 107, column: 14, scope: !170)
!174 = !DILocation(line: 108, column: 9, scope: !170)
!175 = !DILocation(line: 109, column: 9, scope: !170)
!176 = !DILocation(line: 109, column: 23, scope: !170)
!177 = !DILocation(line: 111, column: 16, scope: !178)
!178 = distinct !DILexicalBlock(scope: !170, file: !12, line: 111, column: 9)
!179 = !DILocation(line: 111, column: 14, scope: !178)
!180 = !DILocation(line: 111, column: 21, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !12, line: 111, column: 9)
!182 = !DILocation(line: 111, column: 23, scope: !181)
!183 = !DILocation(line: 111, column: 9, scope: !178)
!184 = !DILocation(line: 113, column: 30, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !12, line: 112, column: 9)
!186 = !DILocation(line: 113, column: 23, scope: !185)
!187 = !DILocation(line: 113, column: 13, scope: !185)
!188 = !DILocation(line: 113, column: 18, scope: !185)
!189 = !DILocation(line: 113, column: 21, scope: !185)
!190 = !DILocation(line: 114, column: 9, scope: !185)
!191 = !DILocation(line: 111, column: 31, scope: !181)
!192 = !DILocation(line: 111, column: 9, scope: !181)
!193 = distinct !{!193, !183, !194, !72}
!194 = !DILocation(line: 114, column: 9, scope: !178)
!195 = !DILocation(line: 115, column: 9, scope: !170)
!196 = !DILocation(line: 115, column: 21, scope: !170)
!197 = !DILocation(line: 116, column: 19, scope: !170)
!198 = !DILocation(line: 116, column: 9, scope: !170)
!199 = !DILocation(line: 118, column: 1, scope: !151)
