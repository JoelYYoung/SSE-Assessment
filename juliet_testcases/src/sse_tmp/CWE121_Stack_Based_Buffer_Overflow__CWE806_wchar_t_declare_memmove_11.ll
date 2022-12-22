; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_11.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %call = call i32 (...) @globalReturnsTrue(), !dbg !28
  %tobool = icmp ne i32 %call, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 99) #7, !dbg !33
  %1 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  %5 = bitcast i32* %4 to i8*, !dbg !43
  %6 = load i32*, i32** %data, align 8, !dbg !45
  %call3 = call i64 @wcslen(i32* %6) #8, !dbg !46
  %mul = mul i64 %call3, 4, !dbg !47
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %3, i8* align 4 %5, i64 %mul, i1 false), !dbg !43
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !48
  store i32 0, i32* %arrayidx4, align 4, !dbg !49
  %7 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %7), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_11_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_11_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_11_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !82
  store i32* %arraydecay, i32** %data, align 8, !dbg !83
  %call = call i32 (...) @globalReturnsFalse(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !90
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 49) #7, !dbg !92
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !97
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !98
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !98
  %4 = load i32*, i32** %data, align 8, !dbg !99
  %5 = bitcast i32* %4 to i8*, !dbg !98
  %6 = load i32*, i32** %data, align 8, !dbg !100
  %call3 = call i64 @wcslen(i32* %6) #8, !dbg !101
  %mul = mul i64 %call3, 4, !dbg !102
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %3, i8* align 4 %5, i64 %mul, i1 false), !dbg !98
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !103
  store i32 0, i32* %arrayidx4, align 4, !dbg !104
  %7 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* %7), !dbg !106
  ret void, !dbg !107
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !113
  store i32* %arraydecay, i32** %data, align 8, !dbg !114
  %call = call i32 (...) @globalReturnsTrue(), !dbg !115
  %tobool = icmp ne i32 %call, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !118
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 49) #7, !dbg !120
  %1 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !126
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !127
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !127
  %4 = load i32*, i32** %data, align 8, !dbg !128
  %5 = bitcast i32* %4 to i8*, !dbg !127
  %6 = load i32*, i32** %data, align 8, !dbg !129
  %call3 = call i64 @wcslen(i32* %6) #8, !dbg !130
  %mul = mul i64 %call3, 4, !dbg !131
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %3, i8* align 4 %5, i64 %mul, i1 false), !dbg !127
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !132
  store i32 0, i32* %arrayidx4, align 4, !dbg !133
  %7 = load i32*, i32** %data, align 8, !dbg !134
  call void @printWLine(i32* %7), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_11.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_11_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_11.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 12, scope: !11)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocation(line: 28, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!30 = !DILocation(line: 28, column: 8, scope: !11)
!31 = !DILocation(line: 31, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !12, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 9, scope: !32)
!34 = !DILocation(line: 32, column: 9, scope: !32)
!35 = !DILocation(line: 32, column: 21, scope: !32)
!36 = !DILocation(line: 33, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 35, column: 17, scope: !38)
!43 = !DILocation(line: 37, column: 9, scope: !38)
!44 = !DILocation(line: 37, column: 23, scope: !38)
!45 = !DILocation(line: 37, column: 36, scope: !38)
!46 = !DILocation(line: 37, column: 29, scope: !38)
!47 = !DILocation(line: 37, column: 41, scope: !38)
!48 = !DILocation(line: 38, column: 9, scope: !38)
!49 = !DILocation(line: 38, column: 20, scope: !38)
!50 = !DILocation(line: 39, column: 20, scope: !38)
!51 = !DILocation(line: 39, column: 9, scope: !38)
!52 = !DILocation(line: 41, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_11_good", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 96, column: 5, scope: !53)
!55 = !DILocation(line: 97, column: 5, scope: !53)
!56 = !DILocation(line: 98, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 110, type: !58, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!19, !19, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !12, line: 110, type: !19)
!64 = !DILocation(line: 110, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !12, line: 110, type: !60)
!66 = !DILocation(line: 110, column: 27, scope: !57)
!67 = !DILocation(line: 113, column: 22, scope: !57)
!68 = !DILocation(line: 113, column: 12, scope: !57)
!69 = !DILocation(line: 113, column: 5, scope: !57)
!70 = !DILocation(line: 115, column: 5, scope: !57)
!71 = !DILocation(line: 116, column: 5, scope: !57)
!72 = !DILocation(line: 117, column: 5, scope: !57)
!73 = !DILocation(line: 120, column: 5, scope: !57)
!74 = !DILocation(line: 121, column: 5, scope: !57)
!75 = !DILocation(line: 122, column: 5, scope: !57)
!76 = !DILocation(line: 124, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 50, type: !16)
!79 = !DILocation(line: 50, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !12, line: 51, type: !22)
!81 = !DILocation(line: 51, column: 13, scope: !77)
!82 = !DILocation(line: 52, column: 12, scope: !77)
!83 = !DILocation(line: 52, column: 10, scope: !77)
!84 = !DILocation(line: 53, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !12, line: 53, column: 8)
!86 = !DILocation(line: 53, column: 8, scope: !77)
!87 = !DILocation(line: 56, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !12, line: 54, column: 5)
!89 = !DILocation(line: 57, column: 5, scope: !88)
!90 = !DILocation(line: 61, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !12, line: 59, column: 5)
!92 = !DILocation(line: 61, column: 9, scope: !91)
!93 = !DILocation(line: 62, column: 9, scope: !91)
!94 = !DILocation(line: 62, column: 20, scope: !91)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !12, line: 65, type: !39)
!96 = distinct !DILexicalBlock(scope: !77, file: !12, line: 64, column: 5)
!97 = !DILocation(line: 65, column: 17, scope: !96)
!98 = !DILocation(line: 67, column: 9, scope: !96)
!99 = !DILocation(line: 67, column: 23, scope: !96)
!100 = !DILocation(line: 67, column: 36, scope: !96)
!101 = !DILocation(line: 67, column: 29, scope: !96)
!102 = !DILocation(line: 67, column: 41, scope: !96)
!103 = !DILocation(line: 68, column: 9, scope: !96)
!104 = !DILocation(line: 68, column: 20, scope: !96)
!105 = !DILocation(line: 69, column: 20, scope: !96)
!106 = !DILocation(line: 69, column: 9, scope: !96)
!107 = !DILocation(line: 71, column: 1, scope: !77)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 76, type: !16)
!110 = !DILocation(line: 76, column: 15, scope: !108)
!111 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !12, line: 77, type: !22)
!112 = !DILocation(line: 77, column: 13, scope: !108)
!113 = !DILocation(line: 78, column: 12, scope: !108)
!114 = !DILocation(line: 78, column: 10, scope: !108)
!115 = !DILocation(line: 79, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !108, file: !12, line: 79, column: 8)
!117 = !DILocation(line: 79, column: 8, scope: !108)
!118 = !DILocation(line: 82, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 80, column: 5)
!120 = !DILocation(line: 82, column: 9, scope: !119)
!121 = !DILocation(line: 83, column: 9, scope: !119)
!122 = !DILocation(line: 83, column: 20, scope: !119)
!123 = !DILocation(line: 84, column: 5, scope: !119)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !12, line: 86, type: !39)
!125 = distinct !DILexicalBlock(scope: !108, file: !12, line: 85, column: 5)
!126 = !DILocation(line: 86, column: 17, scope: !125)
!127 = !DILocation(line: 88, column: 9, scope: !125)
!128 = !DILocation(line: 88, column: 23, scope: !125)
!129 = !DILocation(line: 88, column: 36, scope: !125)
!130 = !DILocation(line: 88, column: 29, scope: !125)
!131 = !DILocation(line: 88, column: 41, scope: !125)
!132 = !DILocation(line: 89, column: 9, scope: !125)
!133 = !DILocation(line: 89, column: 20, scope: !125)
!134 = !DILocation(line: 90, column: 20, scope: !125)
!135 = !DILocation(line: 90, column: 9, scope: !125)
!136 = !DILocation(line: 92, column: 1, scope: !108)
