; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay, i8** %data, align 8, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx2, align 1, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !58
  %cmp = icmp ult i64 %2, 100, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !64
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !64
  %5 = load i8*, i8** %data, align 8, !dbg !65
  %6 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !65
  store i8 %4, i8* %arrayidx4, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %7, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !74
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !74
  store i8 0, i8* %arrayidx5, align 1, !dbg !75
  %9 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %9), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_05_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #5, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #5, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_05_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_05_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i32, i32* @staticFalse, align 4, !dbg !108
  %tobool = icmp ne i32 %0, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store i8* %arraydecay, i8** %data, align 8, !dbg !116
  %1 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !124
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx2, align 1, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !130
  %cmp = icmp ult i64 %2, 100, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !136
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !136
  %5 = load i8*, i8** %data, align 8, !dbg !137
  %6 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !137
  store i8 %4, i8* %arrayidx4, align 1, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %7, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !145
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !145
  store i8 0, i8* %arrayidx5, align 1, !dbg !146
  %9 = load i8*, i8** %data, align 8, !dbg !147
  call void @printLine(i8* %9), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  %0 = load i32, i32* @staticTrue, align 4, !dbg !157
  %tobool = icmp ne i32 %0, 0, !dbg !157
  br i1 %tobool, label %if.then, label %if.end, !dbg !159

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !160
  store i8* %arraydecay, i8** %data, align 8, !dbg !162
  %1 = load i8*, i8** %data, align 8, !dbg !163
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !163
  store i8 0, i8* %arrayidx, align 1, !dbg !164
  br label %if.end, !dbg !165

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !166, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !169, metadata !DIExpression()), !dbg !170
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !171
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !171
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !172
  store i8 0, i8* %arrayidx2, align 1, !dbg !173
  store i64 0, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !177
  %cmp = icmp ult i64 %2, 100, !dbg !179
  br i1 %cmp, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !183
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !183
  %5 = load i8*, i8** %data, align 8, !dbg !184
  %6 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !184
  store i8 %4, i8* %arrayidx4, align 1, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !188
  %inc = add i64 %7, 1, !dbg !188
  store i64 %inc, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !192
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !192
  store i8 0, i8* %arrayidx5, align 1, !dbg !193
  %9 = load i8*, i8** %data, align 8, !dbg !194
  call void @printLine(i8* %9), !dbg !195
  ret void, !dbg !196
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
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 33, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 34, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 34, column: 10, scope: !18)
!35 = !DILocation(line: 35, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 8)
!37 = !DILocation(line: 35, column: 8, scope: !18)
!38 = !DILocation(line: 39, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 36, column: 5)
!40 = !DILocation(line: 39, column: 14, scope: !39)
!41 = !DILocation(line: 40, column: 9, scope: !39)
!42 = !DILocation(line: 40, column: 17, scope: !39)
!43 = !DILocation(line: 41, column: 5, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !10, line: 43, type: !46)
!45 = distinct !DILexicalBlock(scope: !18, file: !10, line: 42, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 43, column: 16, scope: !45)
!50 = !DILocalVariable(name: "source", scope: !45, file: !10, line: 44, type: !31)
!51 = !DILocation(line: 44, column: 14, scope: !45)
!52 = !DILocation(line: 45, column: 9, scope: !45)
!53 = !DILocation(line: 46, column: 9, scope: !45)
!54 = !DILocation(line: 46, column: 23, scope: !45)
!55 = !DILocation(line: 48, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !45, file: !10, line: 48, column: 9)
!57 = !DILocation(line: 48, column: 14, scope: !56)
!58 = !DILocation(line: 48, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !10, line: 48, column: 9)
!60 = !DILocation(line: 48, column: 23, scope: !59)
!61 = !DILocation(line: 48, column: 9, scope: !56)
!62 = !DILocation(line: 50, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !10, line: 49, column: 9)
!64 = !DILocation(line: 50, column: 23, scope: !63)
!65 = !DILocation(line: 50, column: 13, scope: !63)
!66 = !DILocation(line: 50, column: 18, scope: !63)
!67 = !DILocation(line: 50, column: 21, scope: !63)
!68 = !DILocation(line: 51, column: 9, scope: !63)
!69 = !DILocation(line: 48, column: 31, scope: !59)
!70 = !DILocation(line: 48, column: 9, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 51, column: 9, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 52, column: 9, scope: !45)
!75 = !DILocation(line: 52, column: 21, scope: !45)
!76 = !DILocation(line: 53, column: 19, scope: !45)
!77 = !DILocation(line: 53, column: 9, scope: !45)
!78 = !DILocation(line: 55, column: 1, scope: !18)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_05_good", scope: !10, file: !10, line: 120, type: !19, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 122, column: 5, scope: !79)
!81 = !DILocation(line: 123, column: 5, scope: !79)
!82 = !DILocation(line: 124, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 136, type: !84, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DISubroutineType(types: !85)
!85 = !{!11, !11, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !10, line: 136, type: !11)
!88 = !DILocation(line: 136, column: 14, scope: !83)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !10, line: 136, type: !86)
!90 = !DILocation(line: 136, column: 27, scope: !83)
!91 = !DILocation(line: 139, column: 22, scope: !83)
!92 = !DILocation(line: 139, column: 12, scope: !83)
!93 = !DILocation(line: 139, column: 5, scope: !83)
!94 = !DILocation(line: 141, column: 5, scope: !83)
!95 = !DILocation(line: 142, column: 5, scope: !83)
!96 = !DILocation(line: 143, column: 5, scope: !83)
!97 = !DILocation(line: 146, column: 5, scope: !83)
!98 = !DILocation(line: 147, column: 5, scope: !83)
!99 = !DILocation(line: 148, column: 5, scope: !83)
!100 = !DILocation(line: 150, column: 5, scope: !83)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 62, type: !19, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !10, line: 64, type: !22)
!103 = !DILocation(line: 64, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !10, line: 65, type: !26)
!105 = !DILocation(line: 65, column: 10, scope: !101)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !10, line: 66, type: !31)
!107 = !DILocation(line: 66, column: 10, scope: !101)
!108 = !DILocation(line: 67, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !101, file: !10, line: 67, column: 8)
!110 = !DILocation(line: 67, column: 8, scope: !101)
!111 = !DILocation(line: 70, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !10, line: 68, column: 5)
!113 = !DILocation(line: 71, column: 5, scope: !112)
!114 = !DILocation(line: 75, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !10, line: 73, column: 5)
!116 = !DILocation(line: 75, column: 14, scope: !115)
!117 = !DILocation(line: 76, column: 9, scope: !115)
!118 = !DILocation(line: 76, column: 17, scope: !115)
!119 = !DILocalVariable(name: "i", scope: !120, file: !10, line: 79, type: !46)
!120 = distinct !DILexicalBlock(scope: !101, file: !10, line: 78, column: 5)
!121 = !DILocation(line: 79, column: 16, scope: !120)
!122 = !DILocalVariable(name: "source", scope: !120, file: !10, line: 80, type: !31)
!123 = !DILocation(line: 80, column: 14, scope: !120)
!124 = !DILocation(line: 81, column: 9, scope: !120)
!125 = !DILocation(line: 82, column: 9, scope: !120)
!126 = !DILocation(line: 82, column: 23, scope: !120)
!127 = !DILocation(line: 84, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !120, file: !10, line: 84, column: 9)
!129 = !DILocation(line: 84, column: 14, scope: !128)
!130 = !DILocation(line: 84, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !10, line: 84, column: 9)
!132 = !DILocation(line: 84, column: 23, scope: !131)
!133 = !DILocation(line: 84, column: 9, scope: !128)
!134 = !DILocation(line: 86, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !10, line: 85, column: 9)
!136 = !DILocation(line: 86, column: 23, scope: !135)
!137 = !DILocation(line: 86, column: 13, scope: !135)
!138 = !DILocation(line: 86, column: 18, scope: !135)
!139 = !DILocation(line: 86, column: 21, scope: !135)
!140 = !DILocation(line: 87, column: 9, scope: !135)
!141 = !DILocation(line: 84, column: 31, scope: !131)
!142 = !DILocation(line: 84, column: 9, scope: !131)
!143 = distinct !{!143, !133, !144, !73}
!144 = !DILocation(line: 87, column: 9, scope: !128)
!145 = !DILocation(line: 88, column: 9, scope: !120)
!146 = !DILocation(line: 88, column: 21, scope: !120)
!147 = !DILocation(line: 89, column: 19, scope: !120)
!148 = !DILocation(line: 89, column: 9, scope: !120)
!149 = !DILocation(line: 91, column: 1, scope: !101)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "data", scope: !150, file: !10, line: 96, type: !22)
!152 = !DILocation(line: 96, column: 12, scope: !150)
!153 = !DILocalVariable(name: "dataBadBuffer", scope: !150, file: !10, line: 97, type: !26)
!154 = !DILocation(line: 97, column: 10, scope: !150)
!155 = !DILocalVariable(name: "dataGoodBuffer", scope: !150, file: !10, line: 98, type: !31)
!156 = !DILocation(line: 98, column: 10, scope: !150)
!157 = !DILocation(line: 99, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !150, file: !10, line: 99, column: 8)
!159 = !DILocation(line: 99, column: 8, scope: !150)
!160 = !DILocation(line: 102, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !10, line: 100, column: 5)
!162 = !DILocation(line: 102, column: 14, scope: !161)
!163 = !DILocation(line: 103, column: 9, scope: !161)
!164 = !DILocation(line: 103, column: 17, scope: !161)
!165 = !DILocation(line: 104, column: 5, scope: !161)
!166 = !DILocalVariable(name: "i", scope: !167, file: !10, line: 106, type: !46)
!167 = distinct !DILexicalBlock(scope: !150, file: !10, line: 105, column: 5)
!168 = !DILocation(line: 106, column: 16, scope: !167)
!169 = !DILocalVariable(name: "source", scope: !167, file: !10, line: 107, type: !31)
!170 = !DILocation(line: 107, column: 14, scope: !167)
!171 = !DILocation(line: 108, column: 9, scope: !167)
!172 = !DILocation(line: 109, column: 9, scope: !167)
!173 = !DILocation(line: 109, column: 23, scope: !167)
!174 = !DILocation(line: 111, column: 16, scope: !175)
!175 = distinct !DILexicalBlock(scope: !167, file: !10, line: 111, column: 9)
!176 = !DILocation(line: 111, column: 14, scope: !175)
!177 = !DILocation(line: 111, column: 21, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !10, line: 111, column: 9)
!179 = !DILocation(line: 111, column: 23, scope: !178)
!180 = !DILocation(line: 111, column: 9, scope: !175)
!181 = !DILocation(line: 113, column: 30, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !10, line: 112, column: 9)
!183 = !DILocation(line: 113, column: 23, scope: !182)
!184 = !DILocation(line: 113, column: 13, scope: !182)
!185 = !DILocation(line: 113, column: 18, scope: !182)
!186 = !DILocation(line: 113, column: 21, scope: !182)
!187 = !DILocation(line: 114, column: 9, scope: !182)
!188 = !DILocation(line: 111, column: 31, scope: !178)
!189 = !DILocation(line: 111, column: 9, scope: !178)
!190 = distinct !{!190, !180, !191, !73}
!191 = !DILocation(line: 114, column: 9, scope: !175)
!192 = !DILocation(line: 115, column: 9, scope: !167)
!193 = !DILocation(line: 115, column: 21, scope: !167)
!194 = !DILocation(line: 116, column: 19, scope: !167)
!195 = !DILocation(line: 116, column: 9, scope: !167)
!196 = !DILocation(line: 118, column: 1, scope: !150)
