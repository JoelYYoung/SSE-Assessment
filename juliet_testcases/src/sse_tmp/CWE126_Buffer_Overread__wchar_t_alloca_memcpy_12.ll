; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_12_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  %call3 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !37
  %tobool = icmp ne i32 %call3, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.else, !dbg !39

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  store i32* %8, i32** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.else:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !44
  store i32* %9, i32** %data, align 8, !dbg !46
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !54
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx5, align 4, !dbg !56
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %10 = bitcast i32* %arraydecay6 to i8*, !dbg !57
  %11 = load i32*, i32** %data, align 8, !dbg !58
  %12 = bitcast i32* %11 to i8*, !dbg !57
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call8 = call i64 @wcslen(i32* %arraydecay7) #7, !dbg !60
  %mul = mul i64 %call8, 4, !dbg !61
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !57
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx9, align 4, !dbg !63
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  call void @printWLine(i32* %arraydecay10), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local i32 @globalReturnsTrueOrFalse(...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_12_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #6, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #6, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_12_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_12_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 200, align 16, !dbg !95
  %1 = bitcast i8* %0 to i32*, !dbg !96
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %2 = alloca i8, i64 400, align 16, !dbg !99
  %3 = bitcast i8* %2 to i32*, !dbg !100
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !98
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !101
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !102
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !105
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !106
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !107
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !107
  store i32 0, i32* %arrayidx2, align 4, !dbg !108
  %call3 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !109
  %tobool = icmp ne i32 %call3, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !112
  store i32* %8, i32** %data, align 8, !dbg !114
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !116
  store i32* %9, i32** %data, align 8, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !123
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx5, align 4, !dbg !125
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  %10 = bitcast i32* %arraydecay6 to i8*, !dbg !126
  %11 = load i32*, i32** %data, align 8, !dbg !127
  %12 = bitcast i32* %11 to i8*, !dbg !126
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  %call8 = call i64 @wcslen(i32* %arraydecay7) #7, !dbg !129
  %mul = mul i64 %call8, 4, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %10, i8* align 4 %12, i64 %mul, i1 false), !dbg !126
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx9, align 4, !dbg !132
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !133
  call void @printWLine(i32* %arraydecay10), !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_12_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 13, scope: !15)
!30 = !DILocation(line: 28, column: 5, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 29, column: 25, scope: !15)
!33 = !DILocation(line: 30, column: 13, scope: !15)
!34 = !DILocation(line: 30, column: 5, scope: !15)
!35 = !DILocation(line: 31, column: 5, scope: !15)
!36 = !DILocation(line: 31, column: 27, scope: !15)
!37 = !DILocation(line: 32, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 8)
!39 = !DILocation(line: 32, column: 8, scope: !15)
!40 = !DILocation(line: 35, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !16, line: 33, column: 5)
!42 = !DILocation(line: 35, column: 14, scope: !41)
!43 = !DILocation(line: 36, column: 5, scope: !41)
!44 = !DILocation(line: 40, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !16, line: 38, column: 5)
!46 = !DILocation(line: 40, column: 14, scope: !45)
!47 = !DILocalVariable(name: "dest", scope: !48, file: !16, line: 43, type: !49)
!48 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 43, column: 17, scope: !48)
!53 = !DILocation(line: 44, column: 17, scope: !48)
!54 = !DILocation(line: 44, column: 9, scope: !48)
!55 = !DILocation(line: 45, column: 9, scope: !48)
!56 = !DILocation(line: 45, column: 21, scope: !48)
!57 = !DILocation(line: 48, column: 9, scope: !48)
!58 = !DILocation(line: 48, column: 22, scope: !48)
!59 = !DILocation(line: 48, column: 35, scope: !48)
!60 = !DILocation(line: 48, column: 28, scope: !48)
!61 = !DILocation(line: 48, column: 40, scope: !48)
!62 = !DILocation(line: 49, column: 9, scope: !48)
!63 = !DILocation(line: 49, column: 21, scope: !48)
!64 = !DILocation(line: 50, column: 20, scope: !48)
!65 = !DILocation(line: 50, column: 9, scope: !48)
!66 = !DILocation(line: 52, column: 1, scope: !15)
!67 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_12_good", scope: !16, file: !16, line: 91, type: !17, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 93, column: 5, scope: !67)
!69 = !DILocation(line: 94, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 106, type: !71, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!7, !7, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !16, line: 106, type: !7)
!77 = !DILocation(line: 106, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !16, line: 106, type: !73)
!79 = !DILocation(line: 106, column: 27, scope: !70)
!80 = !DILocation(line: 109, column: 22, scope: !70)
!81 = !DILocation(line: 109, column: 12, scope: !70)
!82 = !DILocation(line: 109, column: 5, scope: !70)
!83 = !DILocation(line: 111, column: 5, scope: !70)
!84 = !DILocation(line: 112, column: 5, scope: !70)
!85 = !DILocation(line: 113, column: 5, scope: !70)
!86 = !DILocation(line: 116, column: 5, scope: !70)
!87 = !DILocation(line: 117, column: 5, scope: !70)
!88 = !DILocation(line: 118, column: 5, scope: !70)
!89 = !DILocation(line: 120, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !16, line: 62, type: !4)
!92 = !DILocation(line: 62, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataBadBuffer", scope: !90, file: !16, line: 63, type: !4)
!94 = !DILocation(line: 63, column: 15, scope: !90)
!95 = !DILocation(line: 63, column: 42, scope: !90)
!96 = !DILocation(line: 63, column: 31, scope: !90)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !90, file: !16, line: 64, type: !4)
!98 = !DILocation(line: 64, column: 15, scope: !90)
!99 = !DILocation(line: 64, column: 43, scope: !90)
!100 = !DILocation(line: 64, column: 32, scope: !90)
!101 = !DILocation(line: 65, column: 13, scope: !90)
!102 = !DILocation(line: 65, column: 5, scope: !90)
!103 = !DILocation(line: 66, column: 5, scope: !90)
!104 = !DILocation(line: 66, column: 25, scope: !90)
!105 = !DILocation(line: 67, column: 13, scope: !90)
!106 = !DILocation(line: 67, column: 5, scope: !90)
!107 = !DILocation(line: 68, column: 5, scope: !90)
!108 = !DILocation(line: 68, column: 27, scope: !90)
!109 = !DILocation(line: 69, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !90, file: !16, line: 69, column: 8)
!111 = !DILocation(line: 69, column: 8, scope: !90)
!112 = !DILocation(line: 72, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !16, line: 70, column: 5)
!114 = !DILocation(line: 72, column: 14, scope: !113)
!115 = !DILocation(line: 73, column: 5, scope: !113)
!116 = !DILocation(line: 77, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !16, line: 75, column: 5)
!118 = !DILocation(line: 77, column: 14, scope: !117)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !16, line: 80, type: !49)
!120 = distinct !DILexicalBlock(scope: !90, file: !16, line: 79, column: 5)
!121 = !DILocation(line: 80, column: 17, scope: !120)
!122 = !DILocation(line: 81, column: 17, scope: !120)
!123 = !DILocation(line: 81, column: 9, scope: !120)
!124 = !DILocation(line: 82, column: 9, scope: !120)
!125 = !DILocation(line: 82, column: 21, scope: !120)
!126 = !DILocation(line: 85, column: 9, scope: !120)
!127 = !DILocation(line: 85, column: 22, scope: !120)
!128 = !DILocation(line: 85, column: 35, scope: !120)
!129 = !DILocation(line: 85, column: 28, scope: !120)
!130 = !DILocation(line: 85, column: 40, scope: !120)
!131 = !DILocation(line: 86, column: 9, scope: !120)
!132 = !DILocation(line: 86, column: 21, scope: !120)
!133 = !DILocation(line: 87, column: 20, scope: !120)
!134 = !DILocation(line: 87, column: 9, scope: !120)
!135 = !DILocation(line: 89, column: 1, scope: !90)
