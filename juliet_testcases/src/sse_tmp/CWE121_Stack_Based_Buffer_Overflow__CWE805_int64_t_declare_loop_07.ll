; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !19, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !36
  %0 = load i32, i32* @staticFive, align 4, !dbg !37
  %cmp = icmp eq i32 %0, 5, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store i64* %arraydecay, i64** %data, align 8, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !57
  %cmp1 = icmp ult i64 %2, 100, !dbg !59
  br i1 %cmp1, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !63
  %4 = load i64, i64* %arrayidx, align 8, !dbg !63
  %5 = load i64*, i64** %data, align 8, !dbg !64
  %6 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !64
  store i64 %4, i64* %arrayidx2, align 8, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %7, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !73
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !73
  %9 = load i64, i64* %arrayidx3, align 8, !dbg !73
  call void @printLongLongLine(i64 %9), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_07_good() #0 !dbg !76 {
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
  %call = call i64 @time(i64* null) #5, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #5, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_07_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_07_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = load i32, i32* @staticFive, align 4, !dbg !107
  %cmp = icmp ne i32 %0, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store i64* %arraydecay, i64** %data, align 8, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !126
  %cmp1 = icmp ult i64 %2, 100, !dbg !128
  br i1 %cmp1, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !132
  %4 = load i64, i64* %arrayidx, align 8, !dbg !132
  %5 = load i64*, i64** %data, align 8, !dbg !133
  %6 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !133
  store i64 %4, i64* %arrayidx2, align 8, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %7, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !141
  %9 = load i64, i64* %arrayidx3, align 8, !dbg !141
  call void @printLongLongLine(i64 %9), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !144 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = load i32, i32* @staticFive, align 4, !dbg !151
  %cmp = icmp eq i32 %0, 5, !dbg !153
  br i1 %cmp, label %if.then, label %if.end, !dbg !154

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !155
  store i64* %arraydecay, i64** %data, align 8, !dbg !157
  br label %if.end, !dbg !158

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !159, metadata !DIExpression()), !dbg !161
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !161
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !164
  store i64 0, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !168
  %cmp1 = icmp ult i64 %2, 100, !dbg !170
  br i1 %cmp1, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !174
  %4 = load i64, i64* %arrayidx, align 8, !dbg !174
  %5 = load i64*, i64** %data, align 8, !dbg !175
  %6 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !175
  store i64 %4, i64* %arrayidx2, align 8, !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !179
  %inc = add i64 %7, 1, !dbg !179
  store i64 %inc, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !183
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !183
  %9 = load i64, i64* %arrayidx3, align 8, !dbg !183
  call void @printLongLongLine(i64 %9), !dbg !184
  ret void, !dbg !185
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
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 29, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !22, line: 27, baseType: !23)
!22 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !24, line: 44, baseType: !25)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!25 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!26 = !DILocation(line: 29, column: 15, scope: !16)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 30, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 50)
!31 = !DILocation(line: 30, column: 13, scope: !16)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 31, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 6400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 31, column: 13, scope: !16)
!37 = !DILocation(line: 32, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !16, file: !8, line: 32, column: 8)
!39 = !DILocation(line: 32, column: 18, scope: !38)
!40 = !DILocation(line: 32, column: 8, scope: !16)
!41 = !DILocation(line: 36, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !8, line: 33, column: 5)
!43 = !DILocation(line: 36, column: 14, scope: !42)
!44 = !DILocation(line: 37, column: 5, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !8, line: 39, type: !33)
!46 = distinct !DILexicalBlock(scope: !16, file: !8, line: 38, column: 5)
!47 = !DILocation(line: 39, column: 17, scope: !46)
!48 = !DILocalVariable(name: "i", scope: !49, file: !8, line: 41, type: !50)
!49 = distinct !DILexicalBlock(scope: !46, file: !8, line: 40, column: 9)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 41, column: 20, scope: !49)
!54 = !DILocation(line: 43, column: 20, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !8, line: 43, column: 13)
!56 = !DILocation(line: 43, column: 18, scope: !55)
!57 = !DILocation(line: 43, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !8, line: 43, column: 13)
!59 = !DILocation(line: 43, column: 27, scope: !58)
!60 = !DILocation(line: 43, column: 13, scope: !55)
!61 = !DILocation(line: 45, column: 34, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !8, line: 44, column: 13)
!63 = !DILocation(line: 45, column: 27, scope: !62)
!64 = !DILocation(line: 45, column: 17, scope: !62)
!65 = !DILocation(line: 45, column: 22, scope: !62)
!66 = !DILocation(line: 45, column: 25, scope: !62)
!67 = !DILocation(line: 46, column: 13, scope: !62)
!68 = !DILocation(line: 43, column: 35, scope: !58)
!69 = !DILocation(line: 43, column: 13, scope: !58)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 46, column: 13, scope: !55)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 47, column: 31, scope: !49)
!74 = !DILocation(line: 47, column: 13, scope: !49)
!75 = !DILocation(line: 50, column: 1, scope: !16)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_07_good", scope: !8, file: !8, line: 111, type: !17, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocation(line: 113, column: 5, scope: !76)
!78 = !DILocation(line: 114, column: 5, scope: !76)
!79 = !DILocation(line: 115, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 127, type: !81, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DISubroutineType(types: !82)
!82 = !{!9, !9, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !8, line: 127, type: !9)
!87 = !DILocation(line: 127, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !8, line: 127, type: !83)
!89 = !DILocation(line: 127, column: 27, scope: !80)
!90 = !DILocation(line: 130, column: 22, scope: !80)
!91 = !DILocation(line: 130, column: 12, scope: !80)
!92 = !DILocation(line: 130, column: 5, scope: !80)
!93 = !DILocation(line: 132, column: 5, scope: !80)
!94 = !DILocation(line: 133, column: 5, scope: !80)
!95 = !DILocation(line: 134, column: 5, scope: !80)
!96 = !DILocation(line: 137, column: 5, scope: !80)
!97 = !DILocation(line: 138, column: 5, scope: !80)
!98 = !DILocation(line: 139, column: 5, scope: !80)
!99 = !DILocation(line: 141, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !8, line: 59, type: !20)
!102 = !DILocation(line: 59, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !8, line: 60, type: !28)
!104 = !DILocation(line: 60, column: 13, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !8, line: 61, type: !33)
!106 = !DILocation(line: 61, column: 13, scope: !100)
!107 = !DILocation(line: 62, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !8, line: 62, column: 8)
!109 = !DILocation(line: 62, column: 18, scope: !108)
!110 = !DILocation(line: 62, column: 8, scope: !100)
!111 = !DILocation(line: 65, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !8, line: 63, column: 5)
!113 = !DILocation(line: 66, column: 5, scope: !112)
!114 = !DILocation(line: 70, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !8, line: 68, column: 5)
!116 = !DILocation(line: 70, column: 14, scope: !115)
!117 = !DILocalVariable(name: "source", scope: !118, file: !8, line: 73, type: !33)
!118 = distinct !DILexicalBlock(scope: !100, file: !8, line: 72, column: 5)
!119 = !DILocation(line: 73, column: 17, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !121, file: !8, line: 75, type: !50)
!121 = distinct !DILexicalBlock(scope: !118, file: !8, line: 74, column: 9)
!122 = !DILocation(line: 75, column: 20, scope: !121)
!123 = !DILocation(line: 77, column: 20, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !8, line: 77, column: 13)
!125 = !DILocation(line: 77, column: 18, scope: !124)
!126 = !DILocation(line: 77, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !8, line: 77, column: 13)
!128 = !DILocation(line: 77, column: 27, scope: !127)
!129 = !DILocation(line: 77, column: 13, scope: !124)
!130 = !DILocation(line: 79, column: 34, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !8, line: 78, column: 13)
!132 = !DILocation(line: 79, column: 27, scope: !131)
!133 = !DILocation(line: 79, column: 17, scope: !131)
!134 = !DILocation(line: 79, column: 22, scope: !131)
!135 = !DILocation(line: 79, column: 25, scope: !131)
!136 = !DILocation(line: 80, column: 13, scope: !131)
!137 = !DILocation(line: 77, column: 35, scope: !127)
!138 = !DILocation(line: 77, column: 13, scope: !127)
!139 = distinct !{!139, !129, !140, !72}
!140 = !DILocation(line: 80, column: 13, scope: !124)
!141 = !DILocation(line: 81, column: 31, scope: !121)
!142 = !DILocation(line: 81, column: 13, scope: !121)
!143 = !DILocation(line: 84, column: 1, scope: !100)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DILocalVariable(name: "data", scope: !144, file: !8, line: 89, type: !20)
!146 = !DILocation(line: 89, column: 15, scope: !144)
!147 = !DILocalVariable(name: "dataBadBuffer", scope: !144, file: !8, line: 90, type: !28)
!148 = !DILocation(line: 90, column: 13, scope: !144)
!149 = !DILocalVariable(name: "dataGoodBuffer", scope: !144, file: !8, line: 91, type: !33)
!150 = !DILocation(line: 91, column: 13, scope: !144)
!151 = !DILocation(line: 92, column: 8, scope: !152)
!152 = distinct !DILexicalBlock(scope: !144, file: !8, line: 92, column: 8)
!153 = !DILocation(line: 92, column: 18, scope: !152)
!154 = !DILocation(line: 92, column: 8, scope: !144)
!155 = !DILocation(line: 95, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !8, line: 93, column: 5)
!157 = !DILocation(line: 95, column: 14, scope: !156)
!158 = !DILocation(line: 96, column: 5, scope: !156)
!159 = !DILocalVariable(name: "source", scope: !160, file: !8, line: 98, type: !33)
!160 = distinct !DILexicalBlock(scope: !144, file: !8, line: 97, column: 5)
!161 = !DILocation(line: 98, column: 17, scope: !160)
!162 = !DILocalVariable(name: "i", scope: !163, file: !8, line: 100, type: !50)
!163 = distinct !DILexicalBlock(scope: !160, file: !8, line: 99, column: 9)
!164 = !DILocation(line: 100, column: 20, scope: !163)
!165 = !DILocation(line: 102, column: 20, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !8, line: 102, column: 13)
!167 = !DILocation(line: 102, column: 18, scope: !166)
!168 = !DILocation(line: 102, column: 25, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !8, line: 102, column: 13)
!170 = !DILocation(line: 102, column: 27, scope: !169)
!171 = !DILocation(line: 102, column: 13, scope: !166)
!172 = !DILocation(line: 104, column: 34, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !8, line: 103, column: 13)
!174 = !DILocation(line: 104, column: 27, scope: !173)
!175 = !DILocation(line: 104, column: 17, scope: !173)
!176 = !DILocation(line: 104, column: 22, scope: !173)
!177 = !DILocation(line: 104, column: 25, scope: !173)
!178 = !DILocation(line: 105, column: 13, scope: !173)
!179 = !DILocation(line: 102, column: 35, scope: !169)
!180 = !DILocation(line: 102, column: 13, scope: !169)
!181 = distinct !{!181, !171, !182, !72}
!182 = !DILocation(line: 105, column: 13, scope: !166)
!183 = !DILocation(line: 106, column: 31, scope: !163)
!184 = !DILocation(line: 106, column: 13, scope: !163)
!185 = !DILocation(line: 109, column: 1, scope: !144)
