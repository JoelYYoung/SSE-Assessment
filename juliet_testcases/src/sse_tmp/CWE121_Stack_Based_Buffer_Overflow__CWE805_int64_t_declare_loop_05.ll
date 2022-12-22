; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  %0 = load i32, i32* @staticTrue, align 4, !dbg !39
  %tobool = icmp ne i32 %0, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i64* %arraydecay, i64** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !46, metadata !DIExpression()), !dbg !48
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !58
  %cmp = icmp ult i64 %2, 100, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !64
  %4 = load i64, i64* %arrayidx, align 8, !dbg !64
  %5 = load i64*, i64** %data, align 8, !dbg !65
  %6 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !65
  store i64 %4, i64* %arrayidx1, align 8, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %7, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !74
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !74
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !74
  call void @printLongLongLine(i64 %9), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05_good() #0 !dbg !77 {
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
  %call = call i64 @time(i64* null) #5, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #5, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i32, i32* @staticFalse, align 4, !dbg !108
  %tobool = icmp ne i32 %0, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.else, !dbg !110

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
  %cmp = icmp ult i64 %2, 100, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !132
  %4 = load i64, i64* %arrayidx, align 8, !dbg !132
  %5 = load i64*, i64** %data, align 8, !dbg !133
  %6 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !133
  store i64 %4, i64* %arrayidx1, align 8, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %7, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !141
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !141
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !141
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !151
  %tobool = icmp ne i32 %0, 0, !dbg !151
  br i1 %tobool, label %if.then, label %if.end, !dbg !153

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !154
  store i64* %arraydecay, i64** %data, align 8, !dbg !156
  br label %if.end, !dbg !157

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !158, metadata !DIExpression()), !dbg !160
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !160
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !160
  call void @llvm.dbg.declare(metadata i64* %i, metadata !161, metadata !DIExpression()), !dbg !163
  store i64 0, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !167
  %cmp = icmp ult i64 %2, 100, !dbg !169
  br i1 %cmp, label %for.body, label %for.end, !dbg !170

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !173
  %4 = load i64, i64* %arrayidx, align 8, !dbg !173
  %5 = load i64*, i64** %data, align 8, !dbg !174
  %6 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !174
  store i64 %4, i64* %arrayidx1, align 8, !dbg !176
  br label %for.inc, !dbg !177

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !178
  %inc = add i64 %7, 1, !dbg !178
  store i64 %inc, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !179, !llvm.loop !180

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !182
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !182
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !182
  call void @printLongLongLine(i64 %9), !dbg !183
  ret void, !dbg !184
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
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 30, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !24, line: 27, baseType: !25)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !26, line: 43, baseType: !27)
!26 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!27 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!28 = !DILocation(line: 30, column: 15, scope: !18)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 31, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 31, column: 13, scope: !18)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 32, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 32, column: 13, scope: !18)
!39 = !DILocation(line: 33, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 8)
!41 = !DILocation(line: 33, column: 8, scope: !18)
!42 = !DILocation(line: 37, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !10, line: 34, column: 5)
!44 = !DILocation(line: 37, column: 14, scope: !43)
!45 = !DILocation(line: 38, column: 5, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !10, line: 40, type: !35)
!47 = distinct !DILexicalBlock(scope: !18, file: !10, line: 39, column: 5)
!48 = !DILocation(line: 40, column: 17, scope: !47)
!49 = !DILocalVariable(name: "i", scope: !50, file: !10, line: 42, type: !51)
!50 = distinct !DILexicalBlock(scope: !47, file: !10, line: 41, column: 9)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 42, column: 20, scope: !50)
!55 = !DILocation(line: 44, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !10, line: 44, column: 13)
!57 = !DILocation(line: 44, column: 18, scope: !56)
!58 = !DILocation(line: 44, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !10, line: 44, column: 13)
!60 = !DILocation(line: 44, column: 27, scope: !59)
!61 = !DILocation(line: 44, column: 13, scope: !56)
!62 = !DILocation(line: 46, column: 34, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !10, line: 45, column: 13)
!64 = !DILocation(line: 46, column: 27, scope: !63)
!65 = !DILocation(line: 46, column: 17, scope: !63)
!66 = !DILocation(line: 46, column: 22, scope: !63)
!67 = !DILocation(line: 46, column: 25, scope: !63)
!68 = !DILocation(line: 47, column: 13, scope: !63)
!69 = !DILocation(line: 44, column: 35, scope: !59)
!70 = !DILocation(line: 44, column: 13, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 47, column: 13, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 48, column: 31, scope: !50)
!75 = !DILocation(line: 48, column: 13, scope: !50)
!76 = !DILocation(line: 51, column: 1, scope: !18)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_05_good", scope: !10, file: !10, line: 112, type: !19, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 114, column: 5, scope: !77)
!79 = !DILocation(line: 115, column: 5, scope: !77)
!80 = !DILocation(line: 116, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 128, type: !82, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DISubroutineType(types: !83)
!83 = !{!11, !11, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !10, line: 128, type: !11)
!88 = !DILocation(line: 128, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !10, line: 128, type: !84)
!90 = !DILocation(line: 128, column: 27, scope: !81)
!91 = !DILocation(line: 131, column: 22, scope: !81)
!92 = !DILocation(line: 131, column: 12, scope: !81)
!93 = !DILocation(line: 131, column: 5, scope: !81)
!94 = !DILocation(line: 133, column: 5, scope: !81)
!95 = !DILocation(line: 134, column: 5, scope: !81)
!96 = !DILocation(line: 135, column: 5, scope: !81)
!97 = !DILocation(line: 138, column: 5, scope: !81)
!98 = !DILocation(line: 139, column: 5, scope: !81)
!99 = !DILocation(line: 140, column: 5, scope: !81)
!100 = !DILocation(line: 142, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !10, line: 60, type: !22)
!103 = !DILocation(line: 60, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !10, line: 61, type: !30)
!105 = !DILocation(line: 61, column: 13, scope: !101)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !10, line: 62, type: !35)
!107 = !DILocation(line: 62, column: 13, scope: !101)
!108 = !DILocation(line: 63, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !101, file: !10, line: 63, column: 8)
!110 = !DILocation(line: 63, column: 8, scope: !101)
!111 = !DILocation(line: 66, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !10, line: 64, column: 5)
!113 = !DILocation(line: 67, column: 5, scope: !112)
!114 = !DILocation(line: 71, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !10, line: 69, column: 5)
!116 = !DILocation(line: 71, column: 14, scope: !115)
!117 = !DILocalVariable(name: "source", scope: !118, file: !10, line: 74, type: !35)
!118 = distinct !DILexicalBlock(scope: !101, file: !10, line: 73, column: 5)
!119 = !DILocation(line: 74, column: 17, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !121, file: !10, line: 76, type: !51)
!121 = distinct !DILexicalBlock(scope: !118, file: !10, line: 75, column: 9)
!122 = !DILocation(line: 76, column: 20, scope: !121)
!123 = !DILocation(line: 78, column: 20, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !10, line: 78, column: 13)
!125 = !DILocation(line: 78, column: 18, scope: !124)
!126 = !DILocation(line: 78, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !10, line: 78, column: 13)
!128 = !DILocation(line: 78, column: 27, scope: !127)
!129 = !DILocation(line: 78, column: 13, scope: !124)
!130 = !DILocation(line: 80, column: 34, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !10, line: 79, column: 13)
!132 = !DILocation(line: 80, column: 27, scope: !131)
!133 = !DILocation(line: 80, column: 17, scope: !131)
!134 = !DILocation(line: 80, column: 22, scope: !131)
!135 = !DILocation(line: 80, column: 25, scope: !131)
!136 = !DILocation(line: 81, column: 13, scope: !131)
!137 = !DILocation(line: 78, column: 35, scope: !127)
!138 = !DILocation(line: 78, column: 13, scope: !127)
!139 = distinct !{!139, !129, !140, !73}
!140 = !DILocation(line: 81, column: 13, scope: !124)
!141 = !DILocation(line: 82, column: 31, scope: !121)
!142 = !DILocation(line: 82, column: 13, scope: !121)
!143 = !DILocation(line: 85, column: 1, scope: !101)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 88, type: !19, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DILocalVariable(name: "data", scope: !144, file: !10, line: 90, type: !22)
!146 = !DILocation(line: 90, column: 15, scope: !144)
!147 = !DILocalVariable(name: "dataBadBuffer", scope: !144, file: !10, line: 91, type: !30)
!148 = !DILocation(line: 91, column: 13, scope: !144)
!149 = !DILocalVariable(name: "dataGoodBuffer", scope: !144, file: !10, line: 92, type: !35)
!150 = !DILocation(line: 92, column: 13, scope: !144)
!151 = !DILocation(line: 93, column: 8, scope: !152)
!152 = distinct !DILexicalBlock(scope: !144, file: !10, line: 93, column: 8)
!153 = !DILocation(line: 93, column: 8, scope: !144)
!154 = !DILocation(line: 96, column: 16, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !10, line: 94, column: 5)
!156 = !DILocation(line: 96, column: 14, scope: !155)
!157 = !DILocation(line: 97, column: 5, scope: !155)
!158 = !DILocalVariable(name: "source", scope: !159, file: !10, line: 99, type: !35)
!159 = distinct !DILexicalBlock(scope: !144, file: !10, line: 98, column: 5)
!160 = !DILocation(line: 99, column: 17, scope: !159)
!161 = !DILocalVariable(name: "i", scope: !162, file: !10, line: 101, type: !51)
!162 = distinct !DILexicalBlock(scope: !159, file: !10, line: 100, column: 9)
!163 = !DILocation(line: 101, column: 20, scope: !162)
!164 = !DILocation(line: 103, column: 20, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !10, line: 103, column: 13)
!166 = !DILocation(line: 103, column: 18, scope: !165)
!167 = !DILocation(line: 103, column: 25, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !10, line: 103, column: 13)
!169 = !DILocation(line: 103, column: 27, scope: !168)
!170 = !DILocation(line: 103, column: 13, scope: !165)
!171 = !DILocation(line: 105, column: 34, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !10, line: 104, column: 13)
!173 = !DILocation(line: 105, column: 27, scope: !172)
!174 = !DILocation(line: 105, column: 17, scope: !172)
!175 = !DILocation(line: 105, column: 22, scope: !172)
!176 = !DILocation(line: 105, column: 25, scope: !172)
!177 = !DILocation(line: 106, column: 13, scope: !172)
!178 = !DILocation(line: 103, column: 35, scope: !168)
!179 = !DILocation(line: 103, column: 13, scope: !168)
!180 = distinct !{!180, !170, !181, !73}
!181 = !DILocation(line: 106, column: 13, scope: !165)
!182 = !DILocation(line: 107, column: 31, scope: !162)
!183 = !DILocation(line: 107, column: 13, scope: !162)
!184 = !DILocation(line: 110, column: 1, scope: !144)
