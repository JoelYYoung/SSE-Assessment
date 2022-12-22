; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_08_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx2, align 4, !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !48
  %7 = bitcast i32* %6 to i8*, !dbg !49
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %8 = bitcast i32* %arraydecay3 to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !49
  %9 = load i32*, i32** %data, align 8, !dbg !50
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !50
  store i32 0, i32* %arrayidx4, align 4, !dbg !51
  %10 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %10), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_08_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #5, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #5, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_08_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_08_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !79 {
entry:
  ret i32 1, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 200, align 16, !dbg !88
  %1 = bitcast i8* %0 to i32*, !dbg !89
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %2 = alloca i8, i64 400, align 16, !dbg !92
  %3 = bitcast i8* %2 to i32*, !dbg !93
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !91
  %call = call i32 @staticReturnsFalse(), !dbg !94
  %tobool = icmp ne i32 %call, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end, !dbg !99

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !100
  store i32* %4, i32** %data, align 8, !dbg !102
  %5 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !109
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx2, align 4, !dbg !111
  %6 = load i32*, i32** %data, align 8, !dbg !112
  %7 = bitcast i32* %6 to i8*, !dbg !113
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !113
  %8 = bitcast i32* %arraydecay3 to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !113
  %9 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !114
  store i32 0, i32* %arrayidx4, align 4, !dbg !115
  %10 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* %10), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !119 {
entry:
  ret i32 0, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !121 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = alloca i8, i64 200, align 16, !dbg !126
  %1 = bitcast i8* %0 to i32*, !dbg !127
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %2 = alloca i8, i64 400, align 16, !dbg !130
  %3 = bitcast i8* %2 to i32*, !dbg !131
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !129
  %call = call i32 @staticReturnsTrue(), !dbg !132
  %tobool = icmp ne i32 %call, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !135
  store i32* %4, i32** %data, align 8, !dbg !137
  %5 = load i32*, i32** %data, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !138
  store i32 0, i32* %arrayidx, align 4, !dbg !139
  br label %if.end, !dbg !140

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !141, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !144
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !145
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx2, align 4, !dbg !147
  %6 = load i32*, i32** %data, align 8, !dbg !148
  %7 = bitcast i32* %6 to i8*, !dbg !149
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !149
  %8 = bitcast i32* %arraydecay3 to i8*, !dbg !149
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !149
  %9 = load i32*, i32** %data, align 8, !dbg !150
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !150
  store i32 0, i32* %arrayidx4, align 4, !dbg !151
  %10 = load i32*, i32** %data, align 8, !dbg !152
  call void @printWLine(i32* %10), !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_08_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_08.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 40, type: !4)
!22 = !DILocation(line: 40, column: 15, scope: !15)
!23 = !DILocation(line: 40, column: 42, scope: !15)
!24 = !DILocation(line: 40, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 41, type: !4)
!26 = !DILocation(line: 41, column: 15, scope: !15)
!27 = !DILocation(line: 41, column: 43, scope: !15)
!28 = !DILocation(line: 41, column: 32, scope: !15)
!29 = !DILocation(line: 42, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 8)
!31 = !DILocation(line: 42, column: 8, scope: !15)
!32 = !DILocation(line: 46, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 43, column: 5)
!34 = !DILocation(line: 46, column: 14, scope: !33)
!35 = !DILocation(line: 47, column: 9, scope: !33)
!36 = !DILocation(line: 47, column: 17, scope: !33)
!37 = !DILocation(line: 48, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 50, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 49, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 50, column: 17, scope: !39)
!44 = !DILocation(line: 51, column: 17, scope: !39)
!45 = !DILocation(line: 51, column: 9, scope: !39)
!46 = !DILocation(line: 52, column: 9, scope: !39)
!47 = !DILocation(line: 52, column: 23, scope: !39)
!48 = !DILocation(line: 54, column: 16, scope: !39)
!49 = !DILocation(line: 54, column: 9, scope: !39)
!50 = !DILocation(line: 55, column: 9, scope: !39)
!51 = !DILocation(line: 55, column: 21, scope: !39)
!52 = !DILocation(line: 56, column: 20, scope: !39)
!53 = !DILocation(line: 56, column: 9, scope: !39)
!54 = !DILocation(line: 58, column: 1, scope: !15)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_08_good", scope: !16, file: !16, line: 115, type: !17, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 117, column: 5, scope: !55)
!57 = !DILocation(line: 118, column: 5, scope: !55)
!58 = !DILocation(line: 119, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 131, type: !60, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!7, !7, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !16, line: 131, type: !7)
!66 = !DILocation(line: 131, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !16, line: 131, type: !62)
!68 = !DILocation(line: 131, column: 27, scope: !59)
!69 = !DILocation(line: 134, column: 22, scope: !59)
!70 = !DILocation(line: 134, column: 12, scope: !59)
!71 = !DILocation(line: 134, column: 5, scope: !59)
!72 = !DILocation(line: 136, column: 5, scope: !59)
!73 = !DILocation(line: 137, column: 5, scope: !59)
!74 = !DILocation(line: 138, column: 5, scope: !59)
!75 = !DILocation(line: 141, column: 5, scope: !59)
!76 = !DILocation(line: 142, column: 5, scope: !59)
!77 = !DILocation(line: 143, column: 5, scope: !59)
!78 = !DILocation(line: 145, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 25, type: !80, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!7}
!82 = !DILocation(line: 27, column: 5, scope: !79)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !16, line: 67, type: !4)
!85 = !DILocation(line: 67, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !16, line: 68, type: !4)
!87 = !DILocation(line: 68, column: 15, scope: !83)
!88 = !DILocation(line: 68, column: 42, scope: !83)
!89 = !DILocation(line: 68, column: 31, scope: !83)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !16, line: 69, type: !4)
!91 = !DILocation(line: 69, column: 15, scope: !83)
!92 = !DILocation(line: 69, column: 43, scope: !83)
!93 = !DILocation(line: 69, column: 32, scope: !83)
!94 = !DILocation(line: 70, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !16, line: 70, column: 8)
!96 = !DILocation(line: 70, column: 8, scope: !83)
!97 = !DILocation(line: 73, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !16, line: 71, column: 5)
!99 = !DILocation(line: 74, column: 5, scope: !98)
!100 = !DILocation(line: 78, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !16, line: 76, column: 5)
!102 = !DILocation(line: 78, column: 14, scope: !101)
!103 = !DILocation(line: 79, column: 9, scope: !101)
!104 = !DILocation(line: 79, column: 17, scope: !101)
!105 = !DILocalVariable(name: "source", scope: !106, file: !16, line: 82, type: !40)
!106 = distinct !DILexicalBlock(scope: !83, file: !16, line: 81, column: 5)
!107 = !DILocation(line: 82, column: 17, scope: !106)
!108 = !DILocation(line: 83, column: 17, scope: !106)
!109 = !DILocation(line: 83, column: 9, scope: !106)
!110 = !DILocation(line: 84, column: 9, scope: !106)
!111 = !DILocation(line: 84, column: 23, scope: !106)
!112 = !DILocation(line: 86, column: 16, scope: !106)
!113 = !DILocation(line: 86, column: 9, scope: !106)
!114 = !DILocation(line: 87, column: 9, scope: !106)
!115 = !DILocation(line: 87, column: 21, scope: !106)
!116 = !DILocation(line: 88, column: 20, scope: !106)
!117 = !DILocation(line: 88, column: 9, scope: !106)
!118 = !DILocation(line: 90, column: 1, scope: !83)
!119 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 30, type: !80, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocation(line: 32, column: 5, scope: !119)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !16, line: 95, type: !4)
!123 = !DILocation(line: 95, column: 15, scope: !121)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !121, file: !16, line: 96, type: !4)
!125 = !DILocation(line: 96, column: 15, scope: !121)
!126 = !DILocation(line: 96, column: 42, scope: !121)
!127 = !DILocation(line: 96, column: 31, scope: !121)
!128 = !DILocalVariable(name: "dataGoodBuffer", scope: !121, file: !16, line: 97, type: !4)
!129 = !DILocation(line: 97, column: 15, scope: !121)
!130 = !DILocation(line: 97, column: 43, scope: !121)
!131 = !DILocation(line: 97, column: 32, scope: !121)
!132 = !DILocation(line: 98, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !121, file: !16, line: 98, column: 8)
!134 = !DILocation(line: 98, column: 8, scope: !121)
!135 = !DILocation(line: 101, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !16, line: 99, column: 5)
!137 = !DILocation(line: 101, column: 14, scope: !136)
!138 = !DILocation(line: 102, column: 9, scope: !136)
!139 = !DILocation(line: 102, column: 17, scope: !136)
!140 = !DILocation(line: 103, column: 5, scope: !136)
!141 = !DILocalVariable(name: "source", scope: !142, file: !16, line: 105, type: !40)
!142 = distinct !DILexicalBlock(scope: !121, file: !16, line: 104, column: 5)
!143 = !DILocation(line: 105, column: 17, scope: !142)
!144 = !DILocation(line: 106, column: 17, scope: !142)
!145 = !DILocation(line: 106, column: 9, scope: !142)
!146 = !DILocation(line: 107, column: 9, scope: !142)
!147 = !DILocation(line: 107, column: 23, scope: !142)
!148 = !DILocation(line: 109, column: 16, scope: !142)
!149 = !DILocation(line: 109, column: 9, scope: !142)
!150 = !DILocation(line: 110, column: 9, scope: !142)
!151 = !DILocation(line: 110, column: 21, scope: !142)
!152 = !DILocation(line: 111, column: 20, scope: !142)
!153 = !DILocation(line: 111, column: 9, scope: !142)
!154 = !DILocation(line: 113, column: 1, scope: !121)
