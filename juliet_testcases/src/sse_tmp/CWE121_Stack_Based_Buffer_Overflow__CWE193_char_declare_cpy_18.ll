; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_18_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source1 = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  br label %source, !dbg !29

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !30), !dbg !31
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  %0 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  call void @llvm.dbg.declare(metadata [11 x i8]* %source1, metadata !36, metadata !DIExpression()), !dbg !38
  %1 = bitcast [11 x i8]* %source1 to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_18_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !40
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay2) #5, !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* %3), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_18_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #5, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #5, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_18_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_18_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source1 = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  br label %source, !dbg !74

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !75), !dbg !76
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !77
  store i8* %arraydecay, i8** %data, align 8, !dbg !78
  %0 = load i8*, i8** %data, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  call void @llvm.dbg.declare(metadata [11 x i8]* %source1, metadata !81, metadata !DIExpression()), !dbg !83
  %1 = bitcast [11 x i8]* %source1 to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !83
  %2 = load i8*, i8** %data, align 8, !dbg !84
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !85
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay2) #5, !dbg !86
  %3 = load i8*, i8** %data, align 8, !dbg !87
  call void @printLine(i8* %3), !dbg !88
  ret void, !dbg !89
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_18_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_18.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 31, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 32, column: 10, scope: !11)
!29 = !DILocation(line: 33, column: 5, scope: !11)
!30 = !DILabel(scope: !11, name: "source", file: !12, line: 34)
!31 = !DILocation(line: 34, column: 1, scope: !11)
!32 = !DILocation(line: 37, column: 12, scope: !11)
!33 = !DILocation(line: 37, column: 10, scope: !11)
!34 = !DILocation(line: 38, column: 5, scope: !11)
!35 = !DILocation(line: 38, column: 13, scope: !11)
!36 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 40, type: !25)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!38 = !DILocation(line: 40, column: 14, scope: !37)
!39 = !DILocation(line: 42, column: 16, scope: !37)
!40 = !DILocation(line: 42, column: 22, scope: !37)
!41 = !DILocation(line: 42, column: 9, scope: !37)
!42 = !DILocation(line: 43, column: 19, scope: !37)
!43 = !DILocation(line: 43, column: 9, scope: !37)
!44 = !DILocation(line: 45, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_18_good", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 73, column: 5, scope: !45)
!47 = !DILocation(line: 74, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 86, type: !49, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 86, type: !51)
!54 = !DILocation(line: 86, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 86, type: !52)
!56 = !DILocation(line: 86, column: 27, scope: !48)
!57 = !DILocation(line: 89, column: 22, scope: !48)
!58 = !DILocation(line: 89, column: 12, scope: !48)
!59 = !DILocation(line: 89, column: 5, scope: !48)
!60 = !DILocation(line: 91, column: 5, scope: !48)
!61 = !DILocation(line: 92, column: 5, scope: !48)
!62 = !DILocation(line: 93, column: 5, scope: !48)
!63 = !DILocation(line: 96, column: 5, scope: !48)
!64 = !DILocation(line: 97, column: 5, scope: !48)
!65 = !DILocation(line: 98, column: 5, scope: !48)
!66 = !DILocation(line: 100, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !12, line: 54, type: !16)
!69 = !DILocation(line: 54, column: 12, scope: !67)
!70 = !DILocalVariable(name: "dataBadBuffer", scope: !67, file: !12, line: 55, type: !20)
!71 = !DILocation(line: 55, column: 10, scope: !67)
!72 = !DILocalVariable(name: "dataGoodBuffer", scope: !67, file: !12, line: 56, type: !25)
!73 = !DILocation(line: 56, column: 10, scope: !67)
!74 = !DILocation(line: 57, column: 5, scope: !67)
!75 = !DILabel(scope: !67, name: "source", file: !12, line: 58)
!76 = !DILocation(line: 58, column: 1, scope: !67)
!77 = !DILocation(line: 61, column: 12, scope: !67)
!78 = !DILocation(line: 61, column: 10, scope: !67)
!79 = !DILocation(line: 62, column: 5, scope: !67)
!80 = !DILocation(line: 62, column: 13, scope: !67)
!81 = !DILocalVariable(name: "source", scope: !82, file: !12, line: 64, type: !25)
!82 = distinct !DILexicalBlock(scope: !67, file: !12, line: 63, column: 5)
!83 = !DILocation(line: 64, column: 14, scope: !82)
!84 = !DILocation(line: 66, column: 16, scope: !82)
!85 = !DILocation(line: 66, column: 22, scope: !82)
!86 = !DILocation(line: 66, column: 9, scope: !82)
!87 = !DILocation(line: 67, column: 19, scope: !82)
!88 = !DILocation(line: 67, column: 9, scope: !82)
!89 = !DILocation(line: 69, column: 1, scope: !67)
