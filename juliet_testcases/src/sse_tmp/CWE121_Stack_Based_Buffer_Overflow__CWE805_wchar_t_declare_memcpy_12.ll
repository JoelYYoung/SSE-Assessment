; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %0 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !40
  store i32* %arraydecay1, i32** %data, align 8, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx2 = getelementptr inbounds i32, i32* %1, i64 0, !dbg !43
  store i32 0, i32* %arrayidx2, align 4, !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #5, !dbg !49
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx5, align 4, !dbg !51
  %2 = load i32*, i32** %data, align 8, !dbg !52
  %3 = bitcast i32* %2 to i8*, !dbg !53
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %4 = bitcast i32* %arraydecay6 to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !54
  store i32 0, i32* %arrayidx7, align 4, !dbg !55
  %6 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %6), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_12_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #5, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #5, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_12_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_12_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !89
  %tobool = icmp ne i32 %call, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !92
  store i32* %arraydecay, i32** %data, align 8, !dbg !94
  %0 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  store i32* %arraydecay1, i32** %data, align 8, !dbg !100
  %1 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i32, i32* %1, i64 0, !dbg !101
  store i32 0, i32* %arrayidx2, align 4, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #5, !dbg !107
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx5, align 4, !dbg !109
  %2 = load i32*, i32** %data, align 8, !dbg !110
  %3 = bitcast i32* %2 to i8*, !dbg !111
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %4 = bitcast i32* %arraydecay6 to i8*, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx7 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !112
  store i32 0, i32* %arrayidx7, align 4, !dbg !113
  %6 = load i32*, i32** %data, align 8, !dbg !114
  call void @printWLine(i32* %6), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_12.c", directory: "/root/SSE-Assessment")
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
!40 = !DILocation(line: 38, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !12, line: 36, column: 5)
!42 = !DILocation(line: 38, column: 14, scope: !41)
!43 = !DILocation(line: 39, column: 9, scope: !41)
!44 = !DILocation(line: 39, column: 17, scope: !41)
!45 = !DILocalVariable(name: "source", scope: !46, file: !12, line: 42, type: !27)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!47 = !DILocation(line: 42, column: 17, scope: !46)
!48 = !DILocation(line: 43, column: 17, scope: !46)
!49 = !DILocation(line: 43, column: 9, scope: !46)
!50 = !DILocation(line: 44, column: 9, scope: !46)
!51 = !DILocation(line: 44, column: 23, scope: !46)
!52 = !DILocation(line: 46, column: 16, scope: !46)
!53 = !DILocation(line: 46, column: 9, scope: !46)
!54 = !DILocation(line: 47, column: 9, scope: !46)
!55 = !DILocation(line: 47, column: 21, scope: !46)
!56 = !DILocation(line: 48, column: 20, scope: !46)
!57 = !DILocation(line: 48, column: 9, scope: !46)
!58 = !DILocation(line: 50, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_12_good", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 88, column: 5, scope: !59)
!61 = !DILocation(line: 89, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 101, type: !63, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!19, !19, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 101, type: !19)
!69 = !DILocation(line: 101, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 101, type: !65)
!71 = !DILocation(line: 101, column: 27, scope: !62)
!72 = !DILocation(line: 104, column: 22, scope: !62)
!73 = !DILocation(line: 104, column: 12, scope: !62)
!74 = !DILocation(line: 104, column: 5, scope: !62)
!75 = !DILocation(line: 106, column: 5, scope: !62)
!76 = !DILocation(line: 107, column: 5, scope: !62)
!77 = !DILocation(line: 108, column: 5, scope: !62)
!78 = !DILocation(line: 111, column: 5, scope: !62)
!79 = !DILocation(line: 112, column: 5, scope: !62)
!80 = !DILocation(line: 113, column: 5, scope: !62)
!81 = !DILocation(line: 115, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 60, type: !16)
!84 = !DILocation(line: 60, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !12, line: 61, type: !22)
!86 = !DILocation(line: 61, column: 13, scope: !82)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !12, line: 62, type: !27)
!88 = !DILocation(line: 62, column: 13, scope: !82)
!89 = !DILocation(line: 63, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !12, line: 63, column: 8)
!91 = !DILocation(line: 63, column: 8, scope: !82)
!92 = !DILocation(line: 66, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !12, line: 64, column: 5)
!94 = !DILocation(line: 66, column: 14, scope: !93)
!95 = !DILocation(line: 67, column: 9, scope: !93)
!96 = !DILocation(line: 67, column: 17, scope: !93)
!97 = !DILocation(line: 68, column: 5, scope: !93)
!98 = !DILocation(line: 72, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !90, file: !12, line: 70, column: 5)
!100 = !DILocation(line: 72, column: 14, scope: !99)
!101 = !DILocation(line: 73, column: 9, scope: !99)
!102 = !DILocation(line: 73, column: 17, scope: !99)
!103 = !DILocalVariable(name: "source", scope: !104, file: !12, line: 76, type: !27)
!104 = distinct !DILexicalBlock(scope: !82, file: !12, line: 75, column: 5)
!105 = !DILocation(line: 76, column: 17, scope: !104)
!106 = !DILocation(line: 77, column: 17, scope: !104)
!107 = !DILocation(line: 77, column: 9, scope: !104)
!108 = !DILocation(line: 78, column: 9, scope: !104)
!109 = !DILocation(line: 78, column: 23, scope: !104)
!110 = !DILocation(line: 80, column: 16, scope: !104)
!111 = !DILocation(line: 80, column: 9, scope: !104)
!112 = !DILocation(line: 81, column: 9, scope: !104)
!113 = !DILocation(line: 81, column: 21, scope: !104)
!114 = !DILocation(line: 82, column: 20, scope: !104)
!115 = !DILocation(line: 82, column: 9, scope: !104)
!116 = !DILocation(line: 84, column: 1, scope: !82)
