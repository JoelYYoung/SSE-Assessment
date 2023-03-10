; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_68b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_68_badData = external dso_local global i8*, align 8
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_68_goodG2BData = external dso_local global i8*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_68_badData, align 8, !dbg !17
  store i8* %0, i8** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !18, metadata !DIExpression()), !dbg !23
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !23
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !23
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !24
  %2 = load i8*, i8** %data, align 8, !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !26
  %call = call i64 @strlen(i8* %3) #6, !dbg !27
  %call1 = call i8* @strncat(i8* %arraydecay, i8* %2, i64 %call) #7, !dbg !28
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  call void @printLine(i8* %4), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_68b_goodG2BSink() #0 !dbg !34 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_68_goodG2BData, align 8, !dbg !37
  store i8* %0, i8** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !40
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  %3 = load i8*, i8** %data, align 8, !dbg !43
  %call = call i64 @strlen(i8* %3) #6, !dbg !44
  %call1 = call i8* @strncat(i8* %arraydecay, i8* %2, i64 %call) #7, !dbg !45
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !46
  store i8 0, i8* %arrayidx, align 1, !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %4), !dbg !49
  ret void, !dbg !50
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 30, column: 12, scope: !9)
!17 = !DILocation(line: 30, column: 19, scope: !9)
!18 = !DILocalVariable(name: "dest", scope: !19, file: !10, line: 32, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 32, column: 14, scope: !19)
!24 = !DILocation(line: 34, column: 17, scope: !19)
!25 = !DILocation(line: 34, column: 23, scope: !19)
!26 = !DILocation(line: 34, column: 36, scope: !19)
!27 = !DILocation(line: 34, column: 29, scope: !19)
!28 = !DILocation(line: 34, column: 9, scope: !19)
!29 = !DILocation(line: 35, column: 9, scope: !19)
!30 = !DILocation(line: 35, column: 20, scope: !19)
!31 = !DILocation(line: 36, column: 19, scope: !19)
!32 = !DILocation(line: 36, column: 9, scope: !19)
!33 = !DILocation(line: 38, column: 1, scope: !9)
!34 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_68b_goodG2BSink", scope: !10, file: !10, line: 45, type: !11, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "data", scope: !34, file: !10, line: 47, type: !14)
!36 = !DILocation(line: 47, column: 12, scope: !34)
!37 = !DILocation(line: 47, column: 19, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !10, line: 49, type: !20)
!39 = distinct !DILexicalBlock(scope: !34, file: !10, line: 48, column: 5)
!40 = !DILocation(line: 49, column: 14, scope: !39)
!41 = !DILocation(line: 51, column: 17, scope: !39)
!42 = !DILocation(line: 51, column: 23, scope: !39)
!43 = !DILocation(line: 51, column: 36, scope: !39)
!44 = !DILocation(line: 51, column: 29, scope: !39)
!45 = !DILocation(line: 51, column: 9, scope: !39)
!46 = !DILocation(line: 52, column: 9, scope: !39)
!47 = !DILocation(line: 52, column: 20, scope: !39)
!48 = !DILocation(line: 53, column: 19, scope: !39)
!49 = !DILocation(line: 53, column: 9, scope: !39)
!50 = !DILocation(line: 55, column: 1, scope: !34)
