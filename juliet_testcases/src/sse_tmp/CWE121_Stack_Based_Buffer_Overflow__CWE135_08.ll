; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_08_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !28
  br label %if.end, !dbg !30

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !31
  %tobool2 = icmp ne i32 %call1, 0, !dbg !31
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !33

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !34, metadata !DIExpression()), !dbg !39
  %0 = load i8*, i8** %data, align 8, !dbg !40
  %call4 = call i64 @strlen(i8* %0) #5, !dbg !41
  store i64 %call4, i64* %dataLen, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !42, metadata !DIExpression()), !dbg !43
  %1 = load i64, i64* %dataLen, align 8, !dbg !44
  %add = add i64 %1, 1, !dbg !44
  %mul = mul i64 %add, 4, !dbg !44
  %2 = alloca i8, i64 %mul, align 16, !dbg !44
  store i8* %2, i8** %dest, align 8, !dbg !43
  %3 = load i8*, i8** %dest, align 8, !dbg !45
  %4 = bitcast i8* %3 to i32*, !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  %6 = bitcast i8* %5 to i32*, !dbg !46
  %call5 = call i32* @wcscpy(i32* %4, i32* %6) #6, !dbg !47
  %7 = load i8*, i8** %dest, align 8, !dbg !48
  call void @printLine(i8* %7), !dbg !49
  br label %if.end6, !dbg !50

if.end6:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_08_good() #0 !dbg !52 {
entry:
  call void @goodB2G1(), !dbg !53
  call void @goodB2G2(), !dbg !54
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_08_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_08_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !76 {
entry:
  ret i32 1, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i8* null, i8** %data, align 8, !dbg !83
  %call = call i32 @staticReturnsTrue(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !87
  br label %if.end, !dbg !89

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !90
  %tobool2 = icmp ne i32 %call1, 0, !dbg !90
  br i1 %tobool2, label %if.then3, label %if.else, !dbg !92

if.then3:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !93
  br label %if.end6, !dbg !95

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !96, metadata !DIExpression()), !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %1 = bitcast i8* %0 to i32*, !dbg !101
  %call4 = call i64 @wcslen(i32* %1) #5, !dbg !102
  store i64 %call4, i64* %dataLen, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !103, metadata !DIExpression()), !dbg !104
  %2 = load i64, i64* %dataLen, align 8, !dbg !105
  %add = add i64 %2, 1, !dbg !105
  %mul = mul i64 %add, 4, !dbg !105
  %3 = alloca i8, i64 %mul, align 16, !dbg !105
  store i8* %3, i8** %dest, align 8, !dbg !104
  %4 = load i8*, i8** %dest, align 8, !dbg !106
  %5 = bitcast i8* %4 to i32*, !dbg !106
  %6 = load i8*, i8** %data, align 8, !dbg !107
  %7 = bitcast i8* %6 to i32*, !dbg !107
  %call5 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !108
  %8 = load i8*, i8** %dest, align 8, !dbg !109
  %9 = bitcast i8* %8 to i32*, !dbg !110
  call void @printWLine(i32* %9), !dbg !111
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  ret void, !dbg !112
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !113 {
entry:
  ret i32 0, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !115 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i8* null, i8** %data, align 8, !dbg !118
  %call = call i32 @staticReturnsTrue(), !dbg !119
  %tobool = icmp ne i32 %call, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !122
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !125
  %tobool2 = icmp ne i32 %call1, 0, !dbg !125
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !127

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !128, metadata !DIExpression()), !dbg !131
  %0 = load i8*, i8** %data, align 8, !dbg !132
  %1 = bitcast i8* %0 to i32*, !dbg !133
  %call4 = call i64 @wcslen(i32* %1) #5, !dbg !134
  store i64 %call4, i64* %dataLen, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !135, metadata !DIExpression()), !dbg !136
  %2 = load i64, i64* %dataLen, align 8, !dbg !137
  %add = add i64 %2, 1, !dbg !137
  %mul = mul i64 %add, 4, !dbg !137
  %3 = alloca i8, i64 %mul, align 16, !dbg !137
  store i8* %3, i8** %dest, align 8, !dbg !136
  %4 = load i8*, i8** %dest, align 8, !dbg !138
  %5 = bitcast i8* %4 to i32*, !dbg !138
  %6 = load i8*, i8** %data, align 8, !dbg !139
  %7 = bitcast i8* %6 to i32*, !dbg !139
  %call5 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !140
  %8 = load i8*, i8** %dest, align 8, !dbg !141
  %9 = bitcast i8* %8 to i32*, !dbg !142
  call void @printWLine(i32* %9), !dbg !143
  br label %if.end6, !dbg !144

if.end6:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !146 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !147, metadata !DIExpression()), !dbg !148
  store i8* null, i8** %data, align 8, !dbg !149
  %call = call i32 @staticReturnsFalse(), !dbg !150
  %tobool = icmp ne i32 %call, 0, !dbg !150
  br i1 %tobool, label %if.then, label %if.else, !dbg !152

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !153
  br label %if.end, !dbg !155

if.else:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8** %data, align 8, !dbg !156
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !158
  %tobool2 = icmp ne i32 %call1, 0, !dbg !158
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !160

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !161, metadata !DIExpression()), !dbg !164
  %0 = load i8*, i8** %data, align 8, !dbg !165
  %call4 = call i64 @strlen(i8* %0) #5, !dbg !166
  store i64 %call4, i64* %dataLen, align 8, !dbg !164
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !167, metadata !DIExpression()), !dbg !168
  %1 = load i64, i64* %dataLen, align 8, !dbg !169
  %add = add i64 %1, 1, !dbg !169
  %mul = mul i64 %add, 1, !dbg !169
  %2 = alloca i8, i64 %mul, align 16, !dbg !169
  store i8* %2, i8** %dest, align 8, !dbg !168
  %3 = load i8*, i8** %dest, align 8, !dbg !170
  %4 = load i8*, i8** %data, align 8, !dbg !171
  %call5 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !172
  %5 = load i8*, i8** %dest, align 8, !dbg !173
  call void @printLine(i8* %5), !dbg !174
  br label %if.end6, !dbg !175

if.end6:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !176
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !177 {
entry:
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !178, metadata !DIExpression()), !dbg !179
  store i8* null, i8** %data, align 8, !dbg !180
  %call = call i32 @staticReturnsTrue(), !dbg !181
  %tobool = icmp ne i32 %call, 0, !dbg !181
  br i1 %tobool, label %if.then, label %if.end, !dbg !183

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8** %data, align 8, !dbg !184
  br label %if.end, !dbg !186

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !187
  %tobool2 = icmp ne i32 %call1, 0, !dbg !187
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !189

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !190, metadata !DIExpression()), !dbg !193
  %0 = load i8*, i8** %data, align 8, !dbg !194
  %call4 = call i64 @strlen(i8* %0) #5, !dbg !195
  store i64 %call4, i64* %dataLen, align 8, !dbg !193
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !196, metadata !DIExpression()), !dbg !197
  %1 = load i64, i64* %dataLen, align 8, !dbg !198
  %add = add i64 %1, 1, !dbg !198
  %mul = mul i64 %add, 1, !dbg !198
  %2 = alloca i8, i64 %mul, align 16, !dbg !198
  store i8* %2, i8** %dest, align 8, !dbg !197
  %3 = load i8*, i8** %dest, align 8, !dbg !199
  %4 = load i8*, i8** %data, align 8, !dbg !200
  %call5 = call i8* @strcpy(i8* %3, i8* %4) #6, !dbg !201
  %5 = load i8*, i8** %dest, align 8, !dbg !202
  call void @printLine(i8* %5), !dbg !203
  br label %if.end6, !dbg !204

if.end6:                                          ; preds = %if.then3, %if.end
  ret void, !dbg !205
}

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_08.c", directory: "/root/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_08_bad", scope: !19, file: !19, line: 40, type: !20, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_08.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 42, type: !4)
!23 = !DILocation(line: 42, column: 12, scope: !18)
!24 = !DILocation(line: 43, column: 10, scope: !18)
!25 = !DILocation(line: 44, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 44, column: 8)
!27 = !DILocation(line: 44, column: 8, scope: !18)
!28 = !DILocation(line: 47, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !19, line: 45, column: 5)
!30 = !DILocation(line: 48, column: 5, scope: !29)
!31 = !DILocation(line: 49, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !18, file: !19, line: 49, column: 8)
!33 = !DILocation(line: 49, column: 8, scope: !18)
!34 = !DILocalVariable(name: "dataLen", scope: !35, file: !19, line: 53, type: !37)
!35 = distinct !DILexicalBlock(scope: !36, file: !19, line: 51, column: 9)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 50, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !38)
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 53, column: 20, scope: !35)
!40 = !DILocation(line: 53, column: 45, scope: !35)
!41 = !DILocation(line: 53, column: 30, scope: !35)
!42 = !DILocalVariable(name: "dest", scope: !35, file: !19, line: 54, type: !4)
!43 = !DILocation(line: 54, column: 20, scope: !35)
!44 = !DILocation(line: 54, column: 35, scope: !35)
!45 = !DILocation(line: 55, column: 26, scope: !35)
!46 = !DILocation(line: 55, column: 32, scope: !35)
!47 = !DILocation(line: 55, column: 19, scope: !35)
!48 = !DILocation(line: 56, column: 31, scope: !35)
!49 = !DILocation(line: 56, column: 13, scope: !35)
!50 = !DILocation(line: 58, column: 5, scope: !36)
!51 = !DILocation(line: 59, column: 1, scope: !18)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_08_good", scope: !19, file: !19, line: 163, type: !20, scopeLine: 164, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 165, column: 5, scope: !52)
!54 = !DILocation(line: 166, column: 5, scope: !52)
!55 = !DILocation(line: 167, column: 5, scope: !52)
!56 = !DILocation(line: 168, column: 5, scope: !52)
!57 = !DILocation(line: 169, column: 1, scope: !52)
!58 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 180, type: !59, scopeLine: 181, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!11, !11, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !19, line: 180, type: !11)
!63 = !DILocation(line: 180, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !19, line: 180, type: !61)
!65 = !DILocation(line: 180, column: 27, scope: !58)
!66 = !DILocation(line: 183, column: 22, scope: !58)
!67 = !DILocation(line: 183, column: 12, scope: !58)
!68 = !DILocation(line: 183, column: 5, scope: !58)
!69 = !DILocation(line: 185, column: 5, scope: !58)
!70 = !DILocation(line: 186, column: 5, scope: !58)
!71 = !DILocation(line: 187, column: 5, scope: !58)
!72 = !DILocation(line: 190, column: 5, scope: !58)
!73 = !DILocation(line: 191, column: 5, scope: !58)
!74 = !DILocation(line: 192, column: 5, scope: !58)
!75 = !DILocation(line: 194, column: 5, scope: !58)
!76 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !19, file: !19, line: 28, type: !77, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!11}
!79 = !DILocation(line: 30, column: 5, scope: !76)
!80 = distinct !DISubprogram(name: "goodB2G1", scope: !19, file: !19, line: 66, type: !20, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !19, line: 68, type: !4)
!82 = !DILocation(line: 68, column: 12, scope: !80)
!83 = !DILocation(line: 69, column: 10, scope: !80)
!84 = !DILocation(line: 70, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !19, line: 70, column: 8)
!86 = !DILocation(line: 70, column: 8, scope: !80)
!87 = !DILocation(line: 73, column: 14, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !19, line: 71, column: 5)
!89 = !DILocation(line: 74, column: 5, scope: !88)
!90 = !DILocation(line: 75, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !80, file: !19, line: 75, column: 8)
!92 = !DILocation(line: 75, column: 8, scope: !80)
!93 = !DILocation(line: 78, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !19, line: 76, column: 5)
!95 = !DILocation(line: 79, column: 5, scope: !94)
!96 = !DILocalVariable(name: "dataLen", scope: !97, file: !19, line: 84, type: !37)
!97 = distinct !DILexicalBlock(scope: !98, file: !19, line: 82, column: 9)
!98 = distinct !DILexicalBlock(scope: !91, file: !19, line: 81, column: 5)
!99 = !DILocation(line: 84, column: 20, scope: !97)
!100 = !DILocation(line: 84, column: 48, scope: !97)
!101 = !DILocation(line: 84, column: 37, scope: !97)
!102 = !DILocation(line: 84, column: 30, scope: !97)
!103 = !DILocalVariable(name: "dest", scope: !97, file: !19, line: 85, type: !4)
!104 = !DILocation(line: 85, column: 20, scope: !97)
!105 = !DILocation(line: 85, column: 35, scope: !97)
!106 = !DILocation(line: 86, column: 26, scope: !97)
!107 = !DILocation(line: 86, column: 32, scope: !97)
!108 = !DILocation(line: 86, column: 19, scope: !97)
!109 = !DILocation(line: 87, column: 35, scope: !97)
!110 = !DILocation(line: 87, column: 24, scope: !97)
!111 = !DILocation(line: 87, column: 13, scope: !97)
!112 = !DILocation(line: 90, column: 1, scope: !80)
!113 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !19, file: !19, line: 33, type: !77, scopeLine: 34, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocation(line: 35, column: 5, scope: !113)
!115 = distinct !DISubprogram(name: "goodB2G2", scope: !19, file: !19, line: 93, type: !20, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !19, line: 95, type: !4)
!117 = !DILocation(line: 95, column: 12, scope: !115)
!118 = !DILocation(line: 96, column: 10, scope: !115)
!119 = !DILocation(line: 97, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !19, line: 97, column: 8)
!121 = !DILocation(line: 97, column: 8, scope: !115)
!122 = !DILocation(line: 100, column: 14, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !19, line: 98, column: 5)
!124 = !DILocation(line: 101, column: 5, scope: !123)
!125 = !DILocation(line: 102, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !115, file: !19, line: 102, column: 8)
!127 = !DILocation(line: 102, column: 8, scope: !115)
!128 = !DILocalVariable(name: "dataLen", scope: !129, file: !19, line: 106, type: !37)
!129 = distinct !DILexicalBlock(scope: !130, file: !19, line: 104, column: 9)
!130 = distinct !DILexicalBlock(scope: !126, file: !19, line: 103, column: 5)
!131 = !DILocation(line: 106, column: 20, scope: !129)
!132 = !DILocation(line: 106, column: 48, scope: !129)
!133 = !DILocation(line: 106, column: 37, scope: !129)
!134 = !DILocation(line: 106, column: 30, scope: !129)
!135 = !DILocalVariable(name: "dest", scope: !129, file: !19, line: 107, type: !4)
!136 = !DILocation(line: 107, column: 20, scope: !129)
!137 = !DILocation(line: 107, column: 35, scope: !129)
!138 = !DILocation(line: 108, column: 26, scope: !129)
!139 = !DILocation(line: 108, column: 32, scope: !129)
!140 = !DILocation(line: 108, column: 19, scope: !129)
!141 = !DILocation(line: 109, column: 35, scope: !129)
!142 = !DILocation(line: 109, column: 24, scope: !129)
!143 = !DILocation(line: 109, column: 13, scope: !129)
!144 = !DILocation(line: 111, column: 5, scope: !130)
!145 = !DILocation(line: 112, column: 1, scope: !115)
!146 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 115, type: !20, scopeLine: 116, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "data", scope: !146, file: !19, line: 117, type: !4)
!148 = !DILocation(line: 117, column: 12, scope: !146)
!149 = !DILocation(line: 118, column: 10, scope: !146)
!150 = !DILocation(line: 119, column: 8, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !19, line: 119, column: 8)
!152 = !DILocation(line: 119, column: 8, scope: !146)
!153 = !DILocation(line: 122, column: 9, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !19, line: 120, column: 5)
!155 = !DILocation(line: 123, column: 5, scope: !154)
!156 = !DILocation(line: 127, column: 14, scope: !157)
!157 = distinct !DILexicalBlock(scope: !151, file: !19, line: 125, column: 5)
!158 = !DILocation(line: 129, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !146, file: !19, line: 129, column: 8)
!160 = !DILocation(line: 129, column: 8, scope: !146)
!161 = !DILocalVariable(name: "dataLen", scope: !162, file: !19, line: 133, type: !37)
!162 = distinct !DILexicalBlock(scope: !163, file: !19, line: 131, column: 9)
!163 = distinct !DILexicalBlock(scope: !159, file: !19, line: 130, column: 5)
!164 = !DILocation(line: 133, column: 20, scope: !162)
!165 = !DILocation(line: 133, column: 45, scope: !162)
!166 = !DILocation(line: 133, column: 30, scope: !162)
!167 = !DILocalVariable(name: "dest", scope: !162, file: !19, line: 134, type: !4)
!168 = !DILocation(line: 134, column: 20, scope: !162)
!169 = !DILocation(line: 134, column: 35, scope: !162)
!170 = !DILocation(line: 135, column: 26, scope: !162)
!171 = !DILocation(line: 135, column: 32, scope: !162)
!172 = !DILocation(line: 135, column: 19, scope: !162)
!173 = !DILocation(line: 136, column: 31, scope: !162)
!174 = !DILocation(line: 136, column: 13, scope: !162)
!175 = !DILocation(line: 138, column: 5, scope: !163)
!176 = !DILocation(line: 139, column: 1, scope: !146)
!177 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 142, type: !20, scopeLine: 143, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!178 = !DILocalVariable(name: "data", scope: !177, file: !19, line: 144, type: !4)
!179 = !DILocation(line: 144, column: 12, scope: !177)
!180 = !DILocation(line: 145, column: 10, scope: !177)
!181 = !DILocation(line: 146, column: 8, scope: !182)
!182 = distinct !DILexicalBlock(scope: !177, file: !19, line: 146, column: 8)
!183 = !DILocation(line: 146, column: 8, scope: !177)
!184 = !DILocation(line: 149, column: 14, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !19, line: 147, column: 5)
!186 = !DILocation(line: 150, column: 5, scope: !185)
!187 = !DILocation(line: 151, column: 8, scope: !188)
!188 = distinct !DILexicalBlock(scope: !177, file: !19, line: 151, column: 8)
!189 = !DILocation(line: 151, column: 8, scope: !177)
!190 = !DILocalVariable(name: "dataLen", scope: !191, file: !19, line: 155, type: !37)
!191 = distinct !DILexicalBlock(scope: !192, file: !19, line: 153, column: 9)
!192 = distinct !DILexicalBlock(scope: !188, file: !19, line: 152, column: 5)
!193 = !DILocation(line: 155, column: 20, scope: !191)
!194 = !DILocation(line: 155, column: 45, scope: !191)
!195 = !DILocation(line: 155, column: 30, scope: !191)
!196 = !DILocalVariable(name: "dest", scope: !191, file: !19, line: 156, type: !4)
!197 = !DILocation(line: 156, column: 20, scope: !191)
!198 = !DILocation(line: 156, column: 35, scope: !191)
!199 = !DILocation(line: 157, column: 26, scope: !191)
!200 = !DILocation(line: 157, column: 32, scope: !191)
!201 = !DILocation(line: 157, column: 19, scope: !191)
!202 = !DILocation(line: 158, column: 31, scope: !191)
!203 = !DILocation(line: 158, column: 13, scope: !191)
!204 = !DILocation(line: 160, column: 5, scope: !192)
!205 = !DILocation(line: 161, column: 1, scope: !177)
