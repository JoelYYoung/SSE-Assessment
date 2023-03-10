; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !28
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %0 = load i32, i32* @staticFive, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !37
  store i8* %add.ptr, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !46, metadata !DIExpression()), !dbg !47
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx3, align 1, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !54
  %cmp4 = icmp ult i64 %1, 100, !dbg !56
  br i1 %cmp4, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !60
  %3 = load i8, i8* %arrayidx5, align 1, !dbg !60
  %4 = load i8*, i8** %data, align 8, !dbg !61
  %5 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !61
  store i8 %3, i8* %arrayidx6, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %6, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !70
  %arrayidx7 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !70
  store i8 0, i8* %arrayidx7, align 1, !dbg !71
  %8 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* %8), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_07_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #5, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE124_Buffer_Underwrite__char_declare_loop_07_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE124_Buffer_Underwrite__char_declare_loop_07_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !102
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %0 = load i32, i32* @staticFive, align 4, !dbg !105
  %cmp = icmp ne i32 %0, 5, !dbg !107
  br i1 %cmp, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !112
  store i8* %arraydecay1, i8** %data, align 8, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !120
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx3, align 1, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !126
  %cmp4 = icmp ult i64 %1, 100, !dbg !128
  br i1 %cmp4, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !132
  %3 = load i8, i8* %arrayidx5, align 1, !dbg !132
  %4 = load i8*, i8** %data, align 8, !dbg !133
  %5 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !133
  store i8 %3, i8* %arrayidx6, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %6, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !141
  %arrayidx7 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !141
  store i8 0, i8* %arrayidx7, align 1, !dbg !142
  %8 = load i8*, i8** %data, align 8, !dbg !143
  call void @printLine(i8* %8), !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !146 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !151
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !152
  store i8 0, i8* %arrayidx, align 1, !dbg !153
  %0 = load i32, i32* @staticFive, align 4, !dbg !154
  %cmp = icmp eq i32 %0, 5, !dbg !156
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !158
  store i8* %arraydecay1, i8** %data, align 8, !dbg !160
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !165, metadata !DIExpression()), !dbg !166
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !167
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !168
  store i8 0, i8* %arrayidx3, align 1, !dbg !169
  store i64 0, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !172

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !173
  %cmp4 = icmp ult i64 %1, 100, !dbg !175
  br i1 %cmp4, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !179
  %3 = load i8, i8* %arrayidx5, align 1, !dbg !179
  %4 = load i8*, i8** %data, align 8, !dbg !180
  %5 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !180
  store i8 %3, i8* %arrayidx6, align 1, !dbg !182
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !184
  %inc = add i64 %6, 1, !dbg !184
  store i64 %inc, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !188
  %arrayidx7 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !188
  store i8 0, i8* %arrayidx7, align 1, !dbg !189
  %8 = load i8*, i8** %data, align 8, !dbg !190
  call void @printLine(i8* %8), !dbg !191
  ret void, !dbg !192
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 31, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 32, column: 10, scope: !16)
!28 = !DILocation(line: 33, column: 5, scope: !16)
!29 = !DILocation(line: 34, column: 5, scope: !16)
!30 = !DILocation(line: 34, column: 23, scope: !16)
!31 = !DILocation(line: 35, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !8, line: 35, column: 8)
!33 = !DILocation(line: 35, column: 18, scope: !32)
!34 = !DILocation(line: 35, column: 8, scope: !16)
!35 = !DILocation(line: 38, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !8, line: 36, column: 5)
!37 = !DILocation(line: 38, column: 27, scope: !36)
!38 = !DILocation(line: 38, column: 14, scope: !36)
!39 = !DILocation(line: 39, column: 5, scope: !36)
!40 = !DILocalVariable(name: "i", scope: !41, file: !8, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 41, column: 16, scope: !41)
!46 = !DILocalVariable(name: "source", scope: !41, file: !8, line: 42, type: !24)
!47 = !DILocation(line: 42, column: 14, scope: !41)
!48 = !DILocation(line: 43, column: 9, scope: !41)
!49 = !DILocation(line: 44, column: 9, scope: !41)
!50 = !DILocation(line: 44, column: 23, scope: !41)
!51 = !DILocation(line: 46, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !41, file: !8, line: 46, column: 9)
!53 = !DILocation(line: 46, column: 14, scope: !52)
!54 = !DILocation(line: 46, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !8, line: 46, column: 9)
!56 = !DILocation(line: 46, column: 23, scope: !55)
!57 = !DILocation(line: 46, column: 9, scope: !52)
!58 = !DILocation(line: 48, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !8, line: 47, column: 9)
!60 = !DILocation(line: 48, column: 23, scope: !59)
!61 = !DILocation(line: 48, column: 13, scope: !59)
!62 = !DILocation(line: 48, column: 18, scope: !59)
!63 = !DILocation(line: 48, column: 21, scope: !59)
!64 = !DILocation(line: 49, column: 9, scope: !59)
!65 = !DILocation(line: 46, column: 31, scope: !55)
!66 = !DILocation(line: 46, column: 9, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 49, column: 9, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 51, column: 9, scope: !41)
!71 = !DILocation(line: 51, column: 21, scope: !41)
!72 = !DILocation(line: 52, column: 19, scope: !41)
!73 = !DILocation(line: 52, column: 9, scope: !41)
!74 = !DILocation(line: 54, column: 1, scope: !16)
!75 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_07_good", scope: !8, file: !8, line: 121, type: !17, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocation(line: 123, column: 5, scope: !75)
!77 = !DILocation(line: 124, column: 5, scope: !75)
!78 = !DILocation(line: 125, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 137, type: !80, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DISubroutineType(types: !81)
!81 = !{!9, !9, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !8, line: 137, type: !9)
!84 = !DILocation(line: 137, column: 14, scope: !79)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !8, line: 137, type: !82)
!86 = !DILocation(line: 137, column: 27, scope: !79)
!87 = !DILocation(line: 140, column: 22, scope: !79)
!88 = !DILocation(line: 140, column: 12, scope: !79)
!89 = !DILocation(line: 140, column: 5, scope: !79)
!90 = !DILocation(line: 142, column: 5, scope: !79)
!91 = !DILocation(line: 143, column: 5, scope: !79)
!92 = !DILocation(line: 144, column: 5, scope: !79)
!93 = !DILocation(line: 147, column: 5, scope: !79)
!94 = !DILocation(line: 148, column: 5, scope: !79)
!95 = !DILocation(line: 149, column: 5, scope: !79)
!96 = !DILocation(line: 151, column: 5, scope: !79)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocalVariable(name: "data", scope: !97, file: !8, line: 63, type: !20)
!99 = !DILocation(line: 63, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !8, line: 64, type: !24)
!101 = !DILocation(line: 64, column: 10, scope: !97)
!102 = !DILocation(line: 65, column: 5, scope: !97)
!103 = !DILocation(line: 66, column: 5, scope: !97)
!104 = !DILocation(line: 66, column: 23, scope: !97)
!105 = !DILocation(line: 67, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !97, file: !8, line: 67, column: 8)
!107 = !DILocation(line: 67, column: 18, scope: !106)
!108 = !DILocation(line: 67, column: 8, scope: !97)
!109 = !DILocation(line: 70, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !8, line: 68, column: 5)
!111 = !DILocation(line: 71, column: 5, scope: !110)
!112 = !DILocation(line: 75, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !8, line: 73, column: 5)
!114 = !DILocation(line: 75, column: 14, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !116, file: !8, line: 78, type: !42)
!116 = distinct !DILexicalBlock(scope: !97, file: !8, line: 77, column: 5)
!117 = !DILocation(line: 78, column: 16, scope: !116)
!118 = !DILocalVariable(name: "source", scope: !116, file: !8, line: 79, type: !24)
!119 = !DILocation(line: 79, column: 14, scope: !116)
!120 = !DILocation(line: 80, column: 9, scope: !116)
!121 = !DILocation(line: 81, column: 9, scope: !116)
!122 = !DILocation(line: 81, column: 23, scope: !116)
!123 = !DILocation(line: 83, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !116, file: !8, line: 83, column: 9)
!125 = !DILocation(line: 83, column: 14, scope: !124)
!126 = !DILocation(line: 83, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !8, line: 83, column: 9)
!128 = !DILocation(line: 83, column: 23, scope: !127)
!129 = !DILocation(line: 83, column: 9, scope: !124)
!130 = !DILocation(line: 85, column: 30, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !8, line: 84, column: 9)
!132 = !DILocation(line: 85, column: 23, scope: !131)
!133 = !DILocation(line: 85, column: 13, scope: !131)
!134 = !DILocation(line: 85, column: 18, scope: !131)
!135 = !DILocation(line: 85, column: 21, scope: !131)
!136 = !DILocation(line: 86, column: 9, scope: !131)
!137 = !DILocation(line: 83, column: 31, scope: !127)
!138 = !DILocation(line: 83, column: 9, scope: !127)
!139 = distinct !{!139, !129, !140, !69}
!140 = !DILocation(line: 86, column: 9, scope: !124)
!141 = !DILocation(line: 88, column: 9, scope: !116)
!142 = !DILocation(line: 88, column: 21, scope: !116)
!143 = !DILocation(line: 89, column: 19, scope: !116)
!144 = !DILocation(line: 89, column: 9, scope: !116)
!145 = !DILocation(line: 91, column: 1, scope: !97)
!146 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 94, type: !17, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!147 = !DILocalVariable(name: "data", scope: !146, file: !8, line: 96, type: !20)
!148 = !DILocation(line: 96, column: 12, scope: !146)
!149 = !DILocalVariable(name: "dataBuffer", scope: !146, file: !8, line: 97, type: !24)
!150 = !DILocation(line: 97, column: 10, scope: !146)
!151 = !DILocation(line: 98, column: 5, scope: !146)
!152 = !DILocation(line: 99, column: 5, scope: !146)
!153 = !DILocation(line: 99, column: 23, scope: !146)
!154 = !DILocation(line: 100, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !146, file: !8, line: 100, column: 8)
!156 = !DILocation(line: 100, column: 18, scope: !155)
!157 = !DILocation(line: 100, column: 8, scope: !146)
!158 = !DILocation(line: 103, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !8, line: 101, column: 5)
!160 = !DILocation(line: 103, column: 14, scope: !159)
!161 = !DILocation(line: 104, column: 5, scope: !159)
!162 = !DILocalVariable(name: "i", scope: !163, file: !8, line: 106, type: !42)
!163 = distinct !DILexicalBlock(scope: !146, file: !8, line: 105, column: 5)
!164 = !DILocation(line: 106, column: 16, scope: !163)
!165 = !DILocalVariable(name: "source", scope: !163, file: !8, line: 107, type: !24)
!166 = !DILocation(line: 107, column: 14, scope: !163)
!167 = !DILocation(line: 108, column: 9, scope: !163)
!168 = !DILocation(line: 109, column: 9, scope: !163)
!169 = !DILocation(line: 109, column: 23, scope: !163)
!170 = !DILocation(line: 111, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !163, file: !8, line: 111, column: 9)
!172 = !DILocation(line: 111, column: 14, scope: !171)
!173 = !DILocation(line: 111, column: 21, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !8, line: 111, column: 9)
!175 = !DILocation(line: 111, column: 23, scope: !174)
!176 = !DILocation(line: 111, column: 9, scope: !171)
!177 = !DILocation(line: 113, column: 30, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !8, line: 112, column: 9)
!179 = !DILocation(line: 113, column: 23, scope: !178)
!180 = !DILocation(line: 113, column: 13, scope: !178)
!181 = !DILocation(line: 113, column: 18, scope: !178)
!182 = !DILocation(line: 113, column: 21, scope: !178)
!183 = !DILocation(line: 114, column: 9, scope: !178)
!184 = !DILocation(line: 111, column: 31, scope: !174)
!185 = !DILocation(line: 111, column: 9, scope: !174)
!186 = distinct !{!186, !176, !187, !69}
!187 = !DILocation(line: 114, column: 9, scope: !171)
!188 = !DILocation(line: 116, column: 9, scope: !163)
!189 = !DILocation(line: 116, column: 21, scope: !163)
!190 = !DILocation(line: 117, column: 19, scope: !163)
!191 = !DILocation(line: 117, column: 9, scope: !163)
!192 = !DILocation(line: 119, column: 1, scope: !146)
