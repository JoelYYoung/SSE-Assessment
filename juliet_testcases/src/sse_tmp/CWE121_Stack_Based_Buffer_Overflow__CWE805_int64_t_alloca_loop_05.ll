; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !14
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05_bad() #0 !dbg !24 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 400, align 16, !dbg !31
  %1 = bitcast i8* %0 to i64*, !dbg !32
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = alloca i8, i64 800, align 16, !dbg !35
  %3 = bitcast i8* %2 to i64*, !dbg !36
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !34
  %4 = load i32, i32* @staticTrue, align 4, !dbg !37
  %tobool = icmp ne i32 %4, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !40
  store i64* %5, i64** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !59
  %cmp = icmp ult i64 %7, 100, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !65
  %9 = load i64, i64* %arrayidx, align 8, !dbg !65
  %10 = load i64*, i64** %data, align 8, !dbg !66
  %11 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx1 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !66
  store i64 %9, i64* %arrayidx1, align 8, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %12, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !75
  %arrayidx2 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !75
  %14 = load i64, i64* %arrayidx2, align 8, !dbg !75
  call void @printLongLongLine(i64 %14), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05_good() #0 !dbg !78 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #5, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #5, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 400, align 16, !dbg !107
  %1 = bitcast i8* %0 to i64*, !dbg !108
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %2 = alloca i8, i64 800, align 16, !dbg !111
  %3 = bitcast i8* %2 to i64*, !dbg !112
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !110
  %4 = load i32, i32* @staticFalse, align 4, !dbg !113
  %tobool = icmp ne i32 %4, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !119
  store i64* %5, i64** %data, align 8, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !131
  %cmp = icmp ult i64 %7, 100, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !137
  %9 = load i64, i64* %arrayidx, align 8, !dbg !137
  %10 = load i64*, i64** %data, align 8, !dbg !138
  %11 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx1 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !138
  store i64 %9, i64* %arrayidx1, align 8, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %12, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !146
  %arrayidx2 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !146
  %14 = load i64, i64* %arrayidx2, align 8, !dbg !146
  call void @printLongLongLine(i64 %14), !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !152, metadata !DIExpression()), !dbg !153
  %0 = alloca i8, i64 400, align 16, !dbg !154
  %1 = bitcast i8* %0 to i64*, !dbg !155
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !153
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %2 = alloca i8, i64 800, align 16, !dbg !158
  %3 = bitcast i8* %2 to i64*, !dbg !159
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !157
  %4 = load i32, i32* @staticTrue, align 4, !dbg !160
  %tobool = icmp ne i32 %4, 0, !dbg !160
  br i1 %tobool, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !163
  store i64* %5, i64** %data, align 8, !dbg !165
  br label %if.end, !dbg !166

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !167, metadata !DIExpression()), !dbg !169
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !169
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !172
  store i64 0, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !176
  %cmp = icmp ult i64 %7, 100, !dbg !178
  br i1 %cmp, label %for.body, label %for.end, !dbg !179

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !182
  %9 = load i64, i64* %arrayidx, align 8, !dbg !182
  %10 = load i64*, i64** %data, align 8, !dbg !183
  %11 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx1 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !183
  store i64 %9, i64* %arrayidx1, align 8, !dbg !185
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !187
  %inc = add i64 %12, 1, !dbg !187
  store i64 %inc, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !191
  %arrayidx2 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !191
  %14 = load i64, i64* %arrayidx2, align 8, !dbg !191
  call void @printLongLongLine(i64 %14), !dbg !192
  ret void, !dbg !193
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !16, line: 23, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 44, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !16, line: 24, type: !17, isLocal: true, isDefinition: true)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"clang version 13.0.0"}
!24 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05_bad", scope: !16, file: !16, line: 28, type: !25, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !DILocalVariable(name: "data", scope: !24, file: !16, line: 30, type: !6)
!28 = !DILocation(line: 30, column: 15, scope: !24)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !24, file: !16, line: 31, type: !6)
!30 = !DILocation(line: 31, column: 15, scope: !24)
!31 = !DILocation(line: 31, column: 42, scope: !24)
!32 = !DILocation(line: 31, column: 31, scope: !24)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !24, file: !16, line: 32, type: !6)
!34 = !DILocation(line: 32, column: 15, scope: !24)
!35 = !DILocation(line: 32, column: 43, scope: !24)
!36 = !DILocation(line: 32, column: 32, scope: !24)
!37 = !DILocation(line: 33, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !24, file: !16, line: 33, column: 8)
!39 = !DILocation(line: 33, column: 8, scope: !24)
!40 = !DILocation(line: 37, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !16, line: 34, column: 5)
!42 = !DILocation(line: 37, column: 14, scope: !41)
!43 = !DILocation(line: 38, column: 5, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !16, line: 40, type: !46)
!45 = distinct !DILexicalBlock(scope: !24, file: !16, line: 39, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 40, column: 17, scope: !45)
!50 = !DILocalVariable(name: "i", scope: !51, file: !16, line: 42, type: !52)
!51 = distinct !DILexicalBlock(scope: !45, file: !16, line: 41, column: 9)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 46, baseType: !54)
!53 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 42, column: 20, scope: !51)
!56 = !DILocation(line: 44, column: 20, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !16, line: 44, column: 13)
!58 = !DILocation(line: 44, column: 18, scope: !57)
!59 = !DILocation(line: 44, column: 25, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !16, line: 44, column: 13)
!61 = !DILocation(line: 44, column: 27, scope: !60)
!62 = !DILocation(line: 44, column: 13, scope: !57)
!63 = !DILocation(line: 46, column: 34, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !16, line: 45, column: 13)
!65 = !DILocation(line: 46, column: 27, scope: !64)
!66 = !DILocation(line: 46, column: 17, scope: !64)
!67 = !DILocation(line: 46, column: 22, scope: !64)
!68 = !DILocation(line: 46, column: 25, scope: !64)
!69 = !DILocation(line: 47, column: 13, scope: !64)
!70 = !DILocation(line: 44, column: 35, scope: !60)
!71 = !DILocation(line: 44, column: 13, scope: !60)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 47, column: 13, scope: !57)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 48, column: 31, scope: !51)
!76 = !DILocation(line: 48, column: 13, scope: !51)
!77 = !DILocation(line: 51, column: 1, scope: !24)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05_good", scope: !16, file: !16, line: 112, type: !25, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 114, column: 5, scope: !78)
!80 = !DILocation(line: 115, column: 5, scope: !78)
!81 = !DILocation(line: 116, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 128, type: !83, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!17, !17, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !16, line: 128, type: !17)
!89 = !DILocation(line: 128, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !16, line: 128, type: !85)
!91 = !DILocation(line: 128, column: 27, scope: !82)
!92 = !DILocation(line: 131, column: 22, scope: !82)
!93 = !DILocation(line: 131, column: 12, scope: !82)
!94 = !DILocation(line: 131, column: 5, scope: !82)
!95 = !DILocation(line: 133, column: 5, scope: !82)
!96 = !DILocation(line: 134, column: 5, scope: !82)
!97 = !DILocation(line: 135, column: 5, scope: !82)
!98 = !DILocation(line: 138, column: 5, scope: !82)
!99 = !DILocation(line: 139, column: 5, scope: !82)
!100 = !DILocation(line: 140, column: 5, scope: !82)
!101 = !DILocation(line: 142, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 58, type: !25, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !16, line: 60, type: !6)
!104 = !DILocation(line: 60, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !16, line: 61, type: !6)
!106 = !DILocation(line: 61, column: 15, scope: !102)
!107 = !DILocation(line: 61, column: 42, scope: !102)
!108 = !DILocation(line: 61, column: 31, scope: !102)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !16, line: 62, type: !6)
!110 = !DILocation(line: 62, column: 15, scope: !102)
!111 = !DILocation(line: 62, column: 43, scope: !102)
!112 = !DILocation(line: 62, column: 32, scope: !102)
!113 = !DILocation(line: 63, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !102, file: !16, line: 63, column: 8)
!115 = !DILocation(line: 63, column: 8, scope: !102)
!116 = !DILocation(line: 66, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !16, line: 64, column: 5)
!118 = !DILocation(line: 67, column: 5, scope: !117)
!119 = !DILocation(line: 71, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !114, file: !16, line: 69, column: 5)
!121 = !DILocation(line: 71, column: 14, scope: !120)
!122 = !DILocalVariable(name: "source", scope: !123, file: !16, line: 74, type: !46)
!123 = distinct !DILexicalBlock(scope: !102, file: !16, line: 73, column: 5)
!124 = !DILocation(line: 74, column: 17, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !126, file: !16, line: 76, type: !52)
!126 = distinct !DILexicalBlock(scope: !123, file: !16, line: 75, column: 9)
!127 = !DILocation(line: 76, column: 20, scope: !126)
!128 = !DILocation(line: 78, column: 20, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !16, line: 78, column: 13)
!130 = !DILocation(line: 78, column: 18, scope: !129)
!131 = !DILocation(line: 78, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !16, line: 78, column: 13)
!133 = !DILocation(line: 78, column: 27, scope: !132)
!134 = !DILocation(line: 78, column: 13, scope: !129)
!135 = !DILocation(line: 80, column: 34, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !16, line: 79, column: 13)
!137 = !DILocation(line: 80, column: 27, scope: !136)
!138 = !DILocation(line: 80, column: 17, scope: !136)
!139 = !DILocation(line: 80, column: 22, scope: !136)
!140 = !DILocation(line: 80, column: 25, scope: !136)
!141 = !DILocation(line: 81, column: 13, scope: !136)
!142 = !DILocation(line: 78, column: 35, scope: !132)
!143 = !DILocation(line: 78, column: 13, scope: !132)
!144 = distinct !{!144, !134, !145, !74}
!145 = !DILocation(line: 81, column: 13, scope: !129)
!146 = !DILocation(line: 82, column: 31, scope: !126)
!147 = !DILocation(line: 82, column: 13, scope: !126)
!148 = !DILocation(line: 85, column: 1, scope: !102)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 88, type: !25, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!150 = !DILocalVariable(name: "data", scope: !149, file: !16, line: 90, type: !6)
!151 = !DILocation(line: 90, column: 15, scope: !149)
!152 = !DILocalVariable(name: "dataBadBuffer", scope: !149, file: !16, line: 91, type: !6)
!153 = !DILocation(line: 91, column: 15, scope: !149)
!154 = !DILocation(line: 91, column: 42, scope: !149)
!155 = !DILocation(line: 91, column: 31, scope: !149)
!156 = !DILocalVariable(name: "dataGoodBuffer", scope: !149, file: !16, line: 92, type: !6)
!157 = !DILocation(line: 92, column: 15, scope: !149)
!158 = !DILocation(line: 92, column: 43, scope: !149)
!159 = !DILocation(line: 92, column: 32, scope: !149)
!160 = !DILocation(line: 93, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !149, file: !16, line: 93, column: 8)
!162 = !DILocation(line: 93, column: 8, scope: !149)
!163 = !DILocation(line: 96, column: 16, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !16, line: 94, column: 5)
!165 = !DILocation(line: 96, column: 14, scope: !164)
!166 = !DILocation(line: 97, column: 5, scope: !164)
!167 = !DILocalVariable(name: "source", scope: !168, file: !16, line: 99, type: !46)
!168 = distinct !DILexicalBlock(scope: !149, file: !16, line: 98, column: 5)
!169 = !DILocation(line: 99, column: 17, scope: !168)
!170 = !DILocalVariable(name: "i", scope: !171, file: !16, line: 101, type: !52)
!171 = distinct !DILexicalBlock(scope: !168, file: !16, line: 100, column: 9)
!172 = !DILocation(line: 101, column: 20, scope: !171)
!173 = !DILocation(line: 103, column: 20, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !16, line: 103, column: 13)
!175 = !DILocation(line: 103, column: 18, scope: !174)
!176 = !DILocation(line: 103, column: 25, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !16, line: 103, column: 13)
!178 = !DILocation(line: 103, column: 27, scope: !177)
!179 = !DILocation(line: 103, column: 13, scope: !174)
!180 = !DILocation(line: 105, column: 34, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !16, line: 104, column: 13)
!182 = !DILocation(line: 105, column: 27, scope: !181)
!183 = !DILocation(line: 105, column: 17, scope: !181)
!184 = !DILocation(line: 105, column: 22, scope: !181)
!185 = !DILocation(line: 105, column: 25, scope: !181)
!186 = !DILocation(line: 106, column: 13, scope: !181)
!187 = !DILocation(line: 103, column: 35, scope: !177)
!188 = !DILocation(line: 103, column: 13, scope: !177)
!189 = distinct !{!189, !179, !190, !74}
!190 = !DILocation(line: 106, column: 13, scope: !174)
!191 = !DILocation(line: 107, column: 31, scope: !171)
!192 = !DILocation(line: 107, column: 13, scope: !171)
!193 = !DILocation(line: 110, column: 1, scope: !149)
