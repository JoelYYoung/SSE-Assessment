; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_10_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %0 = load i32, i32* @globalTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %0, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx2, align 4, !dbg !46
  %2 = load i32*, i32** %data, align 8, !dbg !47
  %3 = bitcast i32* %2 to i8*, !dbg !48
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !48
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !48
  %5 = load i32*, i32** %data, align 8, !dbg !49
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !49
  store i32 0, i32* %arrayidx4, align 4, !dbg !50
  %6 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %6), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_10_good() #0 !dbg !54 {
entry:
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_10_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_10_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = load i32, i32* @globalFalse, align 4, !dbg !85
  %tobool = icmp ne i32 %0, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !91
  store i32* %arraydecay, i32** %data, align 8, !dbg !93
  %1 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !99
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !100
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx2, align 4, !dbg !102
  %2 = load i32*, i32** %data, align 8, !dbg !103
  %3 = bitcast i32* %2 to i8*, !dbg !104
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !104
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !104
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !104
  %5 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !105
  store i32 0, i32* %arrayidx4, align 4, !dbg !106
  %6 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %6), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load i32, i32* @globalTrue, align 4, !dbg !117
  %tobool = icmp ne i32 %0, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  store i32* %arraydecay, i32** %data, align 8, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !129
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !130
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx2, align 4, !dbg !132
  %2 = load i32*, i32** %data, align 8, !dbg !133
  %3 = bitcast i32* %2 to i8*, !dbg !134
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !134
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !134
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !134
  %5 = load i32*, i32** %data, align 8, !dbg !135
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !135
  store i32 0, i32* %arrayidx4, align 4, !dbg !136
  %6 = load i32*, i32** %data, align 8, !dbg !137
  call void @printWLine(i32* %6), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_10_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_10.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 28, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!33 = !DILocation(line: 28, column: 8, scope: !11)
!34 = !DILocation(line: 32, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 29, column: 5)
!36 = !DILocation(line: 32, column: 14, scope: !35)
!37 = !DILocation(line: 33, column: 9, scope: !35)
!38 = !DILocation(line: 33, column: 17, scope: !35)
!39 = !DILocation(line: 34, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 36, type: !27)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!42 = !DILocation(line: 36, column: 17, scope: !41)
!43 = !DILocation(line: 37, column: 17, scope: !41)
!44 = !DILocation(line: 37, column: 9, scope: !41)
!45 = !DILocation(line: 38, column: 9, scope: !41)
!46 = !DILocation(line: 38, column: 23, scope: !41)
!47 = !DILocation(line: 40, column: 17, scope: !41)
!48 = !DILocation(line: 40, column: 9, scope: !41)
!49 = !DILocation(line: 41, column: 9, scope: !41)
!50 = !DILocation(line: 41, column: 21, scope: !41)
!51 = !DILocation(line: 42, column: 20, scope: !41)
!52 = !DILocation(line: 42, column: 9, scope: !41)
!53 = !DILocation(line: 44, column: 1, scope: !11)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_10_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 103, column: 5, scope: !54)
!56 = !DILocation(line: 104, column: 5, scope: !54)
!57 = !DILocation(line: 105, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !59, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!19, !19, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 117, type: !19)
!65 = !DILocation(line: 117, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 117, type: !61)
!67 = !DILocation(line: 117, column: 27, scope: !58)
!68 = !DILocation(line: 120, column: 22, scope: !58)
!69 = !DILocation(line: 120, column: 12, scope: !58)
!70 = !DILocation(line: 120, column: 5, scope: !58)
!71 = !DILocation(line: 122, column: 5, scope: !58)
!72 = !DILocation(line: 123, column: 5, scope: !58)
!73 = !DILocation(line: 124, column: 5, scope: !58)
!74 = !DILocation(line: 127, column: 5, scope: !58)
!75 = !DILocation(line: 128, column: 5, scope: !58)
!76 = !DILocation(line: 129, column: 5, scope: !58)
!77 = !DILocation(line: 131, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 53, type: !16)
!80 = !DILocation(line: 53, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !12, line: 54, type: !22)
!82 = !DILocation(line: 54, column: 13, scope: !78)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !12, line: 55, type: !27)
!84 = !DILocation(line: 55, column: 13, scope: !78)
!85 = !DILocation(line: 56, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !12, line: 56, column: 8)
!87 = !DILocation(line: 56, column: 8, scope: !78)
!88 = !DILocation(line: 59, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !12, line: 57, column: 5)
!90 = !DILocation(line: 60, column: 5, scope: !89)
!91 = !DILocation(line: 64, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !12, line: 62, column: 5)
!93 = !DILocation(line: 64, column: 14, scope: !92)
!94 = !DILocation(line: 65, column: 9, scope: !92)
!95 = !DILocation(line: 65, column: 17, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !12, line: 68, type: !27)
!97 = distinct !DILexicalBlock(scope: !78, file: !12, line: 67, column: 5)
!98 = !DILocation(line: 68, column: 17, scope: !97)
!99 = !DILocation(line: 69, column: 17, scope: !97)
!100 = !DILocation(line: 69, column: 9, scope: !97)
!101 = !DILocation(line: 70, column: 9, scope: !97)
!102 = !DILocation(line: 70, column: 23, scope: !97)
!103 = !DILocation(line: 72, column: 17, scope: !97)
!104 = !DILocation(line: 72, column: 9, scope: !97)
!105 = !DILocation(line: 73, column: 9, scope: !97)
!106 = !DILocation(line: 73, column: 21, scope: !97)
!107 = !DILocation(line: 74, column: 20, scope: !97)
!108 = !DILocation(line: 74, column: 9, scope: !97)
!109 = !DILocation(line: 76, column: 1, scope: !78)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 81, type: !16)
!112 = !DILocation(line: 81, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !12, line: 82, type: !22)
!114 = !DILocation(line: 82, column: 13, scope: !110)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !12, line: 83, type: !27)
!116 = !DILocation(line: 83, column: 13, scope: !110)
!117 = !DILocation(line: 84, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !110, file: !12, line: 84, column: 8)
!119 = !DILocation(line: 84, column: 8, scope: !110)
!120 = !DILocation(line: 87, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 85, column: 5)
!122 = !DILocation(line: 87, column: 14, scope: !121)
!123 = !DILocation(line: 88, column: 9, scope: !121)
!124 = !DILocation(line: 88, column: 17, scope: !121)
!125 = !DILocation(line: 89, column: 5, scope: !121)
!126 = !DILocalVariable(name: "source", scope: !127, file: !12, line: 91, type: !27)
!127 = distinct !DILexicalBlock(scope: !110, file: !12, line: 90, column: 5)
!128 = !DILocation(line: 91, column: 17, scope: !127)
!129 = !DILocation(line: 92, column: 17, scope: !127)
!130 = !DILocation(line: 92, column: 9, scope: !127)
!131 = !DILocation(line: 93, column: 9, scope: !127)
!132 = !DILocation(line: 93, column: 23, scope: !127)
!133 = !DILocation(line: 95, column: 17, scope: !127)
!134 = !DILocation(line: 95, column: 9, scope: !127)
!135 = !DILocation(line: 96, column: 9, scope: !127)
!136 = !DILocation(line: 96, column: 21, scope: !127)
!137 = !DILocation(line: 97, column: 20, scope: !127)
!138 = !DILocation(line: 97, column: 9, scope: !127)
!139 = !DILocation(line: 99, column: 1, scope: !110)
