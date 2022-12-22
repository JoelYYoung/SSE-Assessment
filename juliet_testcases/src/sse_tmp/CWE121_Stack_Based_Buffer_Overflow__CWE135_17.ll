; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_17_bad() #0 !dbg !18 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %j, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %0, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !36
  br label %for.inc, !dbg !38

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !39
  %inc = add nsw i32 %1, 1, !dbg !39
  store i32 %inc, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !40, !llvm.loop !41

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !44
  br label %for.cond1, !dbg !46

for.cond1:                                        ; preds = %for.inc5, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !47
  %cmp2 = icmp slt i32 %2, 1, !dbg !49
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !50

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !56
  %3 = load i8*, i8** %data, align 8, !dbg !57
  %call = call i64 @strlen(i8* %3) #5, !dbg !58
  store i64 %call, i64* %dataLen, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !59, metadata !DIExpression()), !dbg !60
  %4 = load i64, i64* %dataLen, align 8, !dbg !61
  %add = add i64 %4, 1, !dbg !61
  %mul = mul i64 %add, 4, !dbg !61
  %5 = alloca i8, i64 %mul, align 16, !dbg !61
  store i8* %5, i8** %dest, align 8, !dbg !60
  %6 = load i8*, i8** %dest, align 8, !dbg !62
  %7 = bitcast i8* %6 to i32*, !dbg !62
  %8 = load i8*, i8** %data, align 8, !dbg !63
  %9 = bitcast i8* %8 to i32*, !dbg !63
  %call4 = call i32* @wcscpy(i32* %7, i32* %9) #6, !dbg !64
  %10 = load i8*, i8** %dest, align 8, !dbg !65
  call void @printLine(i8* %10), !dbg !66
  br label %for.inc5, !dbg !67

for.inc5:                                         ; preds = %for.body3
  %11 = load i32, i32* %j, align 4, !dbg !68
  %inc6 = add nsw i32 %11, 1, !dbg !68
  store i32 %inc6, i32* %j, align 4, !dbg !68
  br label %for.cond1, !dbg !69, !llvm.loop !70

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_17_good() #0 !dbg !73 {
entry:
  call void @goodB2G(), !dbg !74
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #6, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #6, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_17_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_17_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !95 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32* %k, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* null, i8** %data, align 8, !dbg !102
  store i32 0, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !106
  %cmp = icmp slt i32 %0, 1, !dbg !108
  br i1 %cmp, label %for.body, label %for.end, !dbg !109

for.body:                                         ; preds = %for.cond
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !110
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !113
  %inc = add nsw i32 %1, 1, !dbg !113
  store i32 %inc, i32* %i, align 4, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !117
  br label %for.cond1, !dbg !119

for.cond1:                                        ; preds = %for.inc5, %for.end
  %2 = load i32, i32* %k, align 4, !dbg !120
  %cmp2 = icmp slt i32 %2, 1, !dbg !122
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !123

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !124, metadata !DIExpression()), !dbg !127
  %3 = load i8*, i8** %data, align 8, !dbg !128
  %4 = bitcast i8* %3 to i32*, !dbg !129
  %call = call i64 @wcslen(i32* %4) #5, !dbg !130
  store i64 %call, i64* %dataLen, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !131, metadata !DIExpression()), !dbg !132
  %5 = load i64, i64* %dataLen, align 8, !dbg !133
  %add = add i64 %5, 1, !dbg !133
  %mul = mul i64 %add, 4, !dbg !133
  %6 = alloca i8, i64 %mul, align 16, !dbg !133
  store i8* %6, i8** %dest, align 8, !dbg !132
  %7 = load i8*, i8** %dest, align 8, !dbg !134
  %8 = bitcast i8* %7 to i32*, !dbg !134
  %9 = load i8*, i8** %data, align 8, !dbg !135
  %10 = bitcast i8* %9 to i32*, !dbg !135
  %call4 = call i32* @wcscpy(i32* %8, i32* %10) #6, !dbg !136
  %11 = load i8*, i8** %dest, align 8, !dbg !137
  %12 = bitcast i8* %11 to i32*, !dbg !138
  call void @printWLine(i32* %12), !dbg !139
  br label %for.inc5, !dbg !140

for.inc5:                                         ; preds = %for.body3
  %13 = load i32, i32* %k, align 4, !dbg !141
  %inc6 = add nsw i32 %13, 1, !dbg !141
  store i32 %inc6, i32* %k, align 4, !dbg !141
  br label %for.cond1, !dbg !142, !llvm.loop !143

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !145
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !146 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %j, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i8** %data, metadata !151, metadata !DIExpression()), !dbg !152
  store i8* null, i8** %data, align 8, !dbg !153
  store i32 0, i32* %h, align 4, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !157
  %cmp = icmp slt i32 %0, 1, !dbg !159
  br i1 %cmp, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !161
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !164
  %inc = add nsw i32 %1, 1, !dbg !164
  store i32 %inc, i32* %h, align 4, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !168
  br label %for.cond1, !dbg !170

for.cond1:                                        ; preds = %for.inc5, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !171
  %cmp2 = icmp slt i32 %2, 1, !dbg !173
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !174

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !175, metadata !DIExpression()), !dbg !178
  %3 = load i8*, i8** %data, align 8, !dbg !179
  %call = call i64 @strlen(i8* %3) #5, !dbg !180
  store i64 %call, i64* %dataLen, align 8, !dbg !178
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !181, metadata !DIExpression()), !dbg !182
  %4 = load i64, i64* %dataLen, align 8, !dbg !183
  %add = add i64 %4, 1, !dbg !183
  %mul = mul i64 %add, 1, !dbg !183
  %5 = alloca i8, i64 %mul, align 16, !dbg !183
  store i8* %5, i8** %dest, align 8, !dbg !182
  %6 = load i8*, i8** %dest, align 8, !dbg !184
  %7 = load i8*, i8** %data, align 8, !dbg !185
  %call4 = call i8* @strcpy(i8* %6, i8* %7) #6, !dbg !186
  %8 = load i8*, i8** %dest, align 8, !dbg !187
  call void @printLine(i8* %8), !dbg !188
  br label %for.inc5, !dbg !189

for.inc5:                                         ; preds = %for.body3
  %9 = load i32, i32* %j, align 4, !dbg !190
  %inc6 = add nsw i32 %9, 1, !dbg !190
  store i32 %inc6, i32* %j, align 4, !dbg !190
  br label %for.cond1, !dbg !191, !llvm.loop !192

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !194
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_17_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_17.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "i", scope: !18, file: !19, line: 29, type: !11)
!23 = !DILocation(line: 29, column: 9, scope: !18)
!24 = !DILocalVariable(name: "j", scope: !18, file: !19, line: 29, type: !11)
!25 = !DILocation(line: 29, column: 11, scope: !18)
!26 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 30, type: !4)
!27 = !DILocation(line: 30, column: 12, scope: !18)
!28 = !DILocation(line: 31, column: 10, scope: !18)
!29 = !DILocation(line: 32, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !19, line: 32, column: 5)
!31 = !DILocation(line: 32, column: 9, scope: !30)
!32 = !DILocation(line: 32, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !19, line: 32, column: 5)
!34 = !DILocation(line: 32, column: 18, scope: !33)
!35 = !DILocation(line: 32, column: 5, scope: !30)
!36 = !DILocation(line: 35, column: 14, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !19, line: 33, column: 5)
!38 = !DILocation(line: 36, column: 5, scope: !37)
!39 = !DILocation(line: 32, column: 24, scope: !33)
!40 = !DILocation(line: 32, column: 5, scope: !33)
!41 = distinct !{!41, !35, !42, !43}
!42 = !DILocation(line: 36, column: 5, scope: !30)
!43 = !{!"llvm.loop.mustprogress"}
!44 = !DILocation(line: 37, column: 11, scope: !45)
!45 = distinct !DILexicalBlock(scope: !18, file: !19, line: 37, column: 5)
!46 = !DILocation(line: 37, column: 9, scope: !45)
!47 = !DILocation(line: 37, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !19, line: 37, column: 5)
!49 = !DILocation(line: 37, column: 18, scope: !48)
!50 = !DILocation(line: 37, column: 5, scope: !45)
!51 = !DILocalVariable(name: "dataLen", scope: !52, file: !19, line: 41, type: !54)
!52 = distinct !DILexicalBlock(scope: !53, file: !19, line: 39, column: 9)
!53 = distinct !DILexicalBlock(scope: !48, file: !19, line: 38, column: 5)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !55)
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 41, column: 20, scope: !52)
!57 = !DILocation(line: 41, column: 45, scope: !52)
!58 = !DILocation(line: 41, column: 30, scope: !52)
!59 = !DILocalVariable(name: "dest", scope: !52, file: !19, line: 42, type: !4)
!60 = !DILocation(line: 42, column: 20, scope: !52)
!61 = !DILocation(line: 42, column: 35, scope: !52)
!62 = !DILocation(line: 43, column: 26, scope: !52)
!63 = !DILocation(line: 43, column: 32, scope: !52)
!64 = !DILocation(line: 43, column: 19, scope: !52)
!65 = !DILocation(line: 44, column: 31, scope: !52)
!66 = !DILocation(line: 44, column: 13, scope: !52)
!67 = !DILocation(line: 46, column: 5, scope: !53)
!68 = !DILocation(line: 37, column: 24, scope: !48)
!69 = !DILocation(line: 37, column: 5, scope: !48)
!70 = distinct !{!70, !50, !71, !43}
!71 = !DILocation(line: 46, column: 5, scope: !45)
!72 = !DILocation(line: 47, column: 1, scope: !18)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_17_good", scope: !19, file: !19, line: 99, type: !20, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 101, column: 5, scope: !73)
!75 = !DILocation(line: 102, column: 5, scope: !73)
!76 = !DILocation(line: 103, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 114, type: !78, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!11, !11, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !19, line: 114, type: !11)
!82 = !DILocation(line: 114, column: 14, scope: !77)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !19, line: 114, type: !80)
!84 = !DILocation(line: 114, column: 27, scope: !77)
!85 = !DILocation(line: 117, column: 22, scope: !77)
!86 = !DILocation(line: 117, column: 12, scope: !77)
!87 = !DILocation(line: 117, column: 5, scope: !77)
!88 = !DILocation(line: 119, column: 5, scope: !77)
!89 = !DILocation(line: 120, column: 5, scope: !77)
!90 = !DILocation(line: 121, column: 5, scope: !77)
!91 = !DILocation(line: 124, column: 5, scope: !77)
!92 = !DILocation(line: 125, column: 5, scope: !77)
!93 = !DILocation(line: 126, column: 5, scope: !77)
!94 = !DILocation(line: 128, column: 5, scope: !77)
!95 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 54, type: !20, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "i", scope: !95, file: !19, line: 56, type: !11)
!97 = !DILocation(line: 56, column: 9, scope: !95)
!98 = !DILocalVariable(name: "k", scope: !95, file: !19, line: 56, type: !11)
!99 = !DILocation(line: 56, column: 11, scope: !95)
!100 = !DILocalVariable(name: "data", scope: !95, file: !19, line: 57, type: !4)
!101 = !DILocation(line: 57, column: 12, scope: !95)
!102 = !DILocation(line: 58, column: 10, scope: !95)
!103 = !DILocation(line: 59, column: 11, scope: !104)
!104 = distinct !DILexicalBlock(scope: !95, file: !19, line: 59, column: 5)
!105 = !DILocation(line: 59, column: 9, scope: !104)
!106 = !DILocation(line: 59, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !19, line: 59, column: 5)
!108 = !DILocation(line: 59, column: 18, scope: !107)
!109 = !DILocation(line: 59, column: 5, scope: !104)
!110 = !DILocation(line: 62, column: 14, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !19, line: 60, column: 5)
!112 = !DILocation(line: 63, column: 5, scope: !111)
!113 = !DILocation(line: 59, column: 24, scope: !107)
!114 = !DILocation(line: 59, column: 5, scope: !107)
!115 = distinct !{!115, !109, !116, !43}
!116 = !DILocation(line: 63, column: 5, scope: !104)
!117 = !DILocation(line: 64, column: 11, scope: !118)
!118 = distinct !DILexicalBlock(scope: !95, file: !19, line: 64, column: 5)
!119 = !DILocation(line: 64, column: 9, scope: !118)
!120 = !DILocation(line: 64, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !19, line: 64, column: 5)
!122 = !DILocation(line: 64, column: 18, scope: !121)
!123 = !DILocation(line: 64, column: 5, scope: !118)
!124 = !DILocalVariable(name: "dataLen", scope: !125, file: !19, line: 68, type: !54)
!125 = distinct !DILexicalBlock(scope: !126, file: !19, line: 66, column: 9)
!126 = distinct !DILexicalBlock(scope: !121, file: !19, line: 65, column: 5)
!127 = !DILocation(line: 68, column: 20, scope: !125)
!128 = !DILocation(line: 68, column: 48, scope: !125)
!129 = !DILocation(line: 68, column: 37, scope: !125)
!130 = !DILocation(line: 68, column: 30, scope: !125)
!131 = !DILocalVariable(name: "dest", scope: !125, file: !19, line: 69, type: !4)
!132 = !DILocation(line: 69, column: 20, scope: !125)
!133 = !DILocation(line: 69, column: 35, scope: !125)
!134 = !DILocation(line: 70, column: 26, scope: !125)
!135 = !DILocation(line: 70, column: 32, scope: !125)
!136 = !DILocation(line: 70, column: 19, scope: !125)
!137 = !DILocation(line: 71, column: 35, scope: !125)
!138 = !DILocation(line: 71, column: 24, scope: !125)
!139 = !DILocation(line: 71, column: 13, scope: !125)
!140 = !DILocation(line: 73, column: 5, scope: !126)
!141 = !DILocation(line: 64, column: 24, scope: !121)
!142 = !DILocation(line: 64, column: 5, scope: !121)
!143 = distinct !{!143, !123, !144, !43}
!144 = !DILocation(line: 73, column: 5, scope: !118)
!145 = !DILocation(line: 74, column: 1, scope: !95)
!146 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 77, type: !20, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "h", scope: !146, file: !19, line: 79, type: !11)
!148 = !DILocation(line: 79, column: 9, scope: !146)
!149 = !DILocalVariable(name: "j", scope: !146, file: !19, line: 79, type: !11)
!150 = !DILocation(line: 79, column: 11, scope: !146)
!151 = !DILocalVariable(name: "data", scope: !146, file: !19, line: 80, type: !4)
!152 = !DILocation(line: 80, column: 12, scope: !146)
!153 = !DILocation(line: 81, column: 10, scope: !146)
!154 = !DILocation(line: 82, column: 11, scope: !155)
!155 = distinct !DILexicalBlock(scope: !146, file: !19, line: 82, column: 5)
!156 = !DILocation(line: 82, column: 9, scope: !155)
!157 = !DILocation(line: 82, column: 16, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !19, line: 82, column: 5)
!159 = !DILocation(line: 82, column: 18, scope: !158)
!160 = !DILocation(line: 82, column: 5, scope: !155)
!161 = !DILocation(line: 85, column: 14, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !19, line: 83, column: 5)
!163 = !DILocation(line: 86, column: 5, scope: !162)
!164 = !DILocation(line: 82, column: 24, scope: !158)
!165 = !DILocation(line: 82, column: 5, scope: !158)
!166 = distinct !{!166, !160, !167, !43}
!167 = !DILocation(line: 86, column: 5, scope: !155)
!168 = !DILocation(line: 87, column: 11, scope: !169)
!169 = distinct !DILexicalBlock(scope: !146, file: !19, line: 87, column: 5)
!170 = !DILocation(line: 87, column: 9, scope: !169)
!171 = !DILocation(line: 87, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !19, line: 87, column: 5)
!173 = !DILocation(line: 87, column: 18, scope: !172)
!174 = !DILocation(line: 87, column: 5, scope: !169)
!175 = !DILocalVariable(name: "dataLen", scope: !176, file: !19, line: 91, type: !54)
!176 = distinct !DILexicalBlock(scope: !177, file: !19, line: 89, column: 9)
!177 = distinct !DILexicalBlock(scope: !172, file: !19, line: 88, column: 5)
!178 = !DILocation(line: 91, column: 20, scope: !176)
!179 = !DILocation(line: 91, column: 45, scope: !176)
!180 = !DILocation(line: 91, column: 30, scope: !176)
!181 = !DILocalVariable(name: "dest", scope: !176, file: !19, line: 92, type: !4)
!182 = !DILocation(line: 92, column: 20, scope: !176)
!183 = !DILocation(line: 92, column: 35, scope: !176)
!184 = !DILocation(line: 93, column: 26, scope: !176)
!185 = !DILocation(line: 93, column: 32, scope: !176)
!186 = !DILocation(line: 93, column: 19, scope: !176)
!187 = !DILocation(line: 94, column: 31, scope: !176)
!188 = !DILocation(line: 94, column: 13, scope: !176)
!189 = !DILocation(line: 96, column: 5, scope: !177)
!190 = !DILocation(line: 87, column: 24, scope: !172)
!191 = !DILocation(line: 87, column: 5, scope: !172)
!192 = distinct !{!192, !174, !193, !43}
!193 = !DILocation(line: 96, column: 5, scope: !169)
!194 = !DILocation(line: 97, column: 1, scope: !146)
